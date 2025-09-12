import 'package:flutter/material.dart';
import 'package:portfolio/elements/hover_list_type.dart';
import 'package:portfolio/elements/portfolio_card.dart';
import 'package:portfolio/tools/link_tool.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PortfolioWidget extends StatefulWidget {
  const PortfolioWidget({super.key});

  @override
  State<PortfolioWidget> createState() => _PortfolioWidgetState();
}

class _PortfolioWidgetState extends State<PortfolioWidget> {
  final scrollController = ScrollController();

  // list key cho mỗi project
  final Map<String, GlobalKey> projectKeys = {
    "Website cá nhân": GlobalKey(),
    "Ứng dụng di động": GlobalKey(),
    "Trò chơi Unity": GlobalKey(),
  };

  void scrollToProject(String title) {
    final key = projectKeys[title];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileWidget(
                    name: "Lê Văn Vũ",
                    jobTitle: "Flutter Developer",
                    description:
                        "Passionate about building mobile apps with Flutter. Love UI/UX and clean architecture.",
                    avatarUrl: "https://picsum.photos/200",
                    socialLinks: const [
                      SocialLink(
                        label: "GitHub",
                        icon: Icons.code,
                        url: "https://github.com/vishagna",
                      ),
                      SocialLink(
                        label: "LinkedIn",
                        icon: Icons.work,
                        url: "https://www.linkedin.com/in/vũ-lê-văn-17bbaa307/",
                      ),
                      SocialLink(
                        label: "Facebook",
                        icon: Icons.facebook,
                        url: "https://www.facebook.com/vu.cau.7927/",
                      ),
                    ],
                    archivements: const [
                      "Developed 5+ Flutter apps with 10,000+ downloads",
                      "Bachelor’s in Computer Science from XYZ University",
                      "Winner of ABC Hackathon 2023",
                      "Published articles on Medium about Flutter",
                    ],
                    skills: const [
                      "Room Database",
                      "SQLite",
                      "Firebase",
                      "REST APIs",
                      "Multiplayer Game Development",
                      "Git",
                      "Agile Methodologies",
                    ], // thêm skills
                  ),

                  const SizedBox(width: 24),

                  Expanded(
                    child: Column(
                      children: [
                        ProgrammingLanguageWidget(),
                        SizedBox(height: 24),
                        EngineFrameworkWidget(),
                        SizedBox(height: 24),
                        const JobExperienceWidget(),
                        SizedBox(height: 24),
                        ProjectWidget(
                          projects: [
                            ProjectItem(
                              icon: Icons.web,
                              title: "Website cá nhân",
                              subtitle: "Mô tả ngắn về dự án...",
                            ),
                            ProjectItem(
                              icon: Icons.phone_android,
                              title: "Ứng dụng di động",
                              subtitle: "Mô tả ngắn về dự án...",
                            ),
                            ProjectItem(
                              icon: Icons.gamepad,
                              title: "Trò chơi Unity",
                              subtitle: "Mô tả ngắn về dự án...",
                            ),
                          ],
                          onProjectTap: scrollToProject,
                        ),
                        SizedBox(height: 24),
                        ProjectDescriptionWidget(
                          key: projectKeys["Website cá nhân"],
                          projectName: "Unity Game Project",
                          youtubeUrl:
                              "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
                          imageUrls: [
                            "https://picsum.photos/400/200",
                            "https://picsum.photos/401/200",
                            "https://picsum.photos/402/200",
                          ],
                          features: [
                            "Gameplay mượt mà và hấp dẫn",
                            "Giao diện người dùng thân thiện",
                            "Tối ưu hiệu năng cho trải nghiệm tốt nhất",
                          ],
                          description:
                              "Đây là một dự án Unity game. Mục tiêu là xây dựng gameplay mượt mà, UI thân thiện và tối ưu hiệu năng.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLink {
  final String label;
  final IconData icon;
  final String url;

  const SocialLink({
    required this.label,
    required this.icon,
    required this.url,
  });
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String description;
  final String avatarUrl; // network hoặc asset path
  final List<SocialLink> socialLinks;
  final List<String> archivements;
  final List<String> skills; // ✅ thêm skills

  const ProfileWidget({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.description,
    required this.avatarUrl,
    this.socialLinks = const [],
    this.archivements = const [],
    this.skills = const [], // mặc định rỗng
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      width: 400,
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: avatarUrl.startsWith("http")
                  ? NetworkImage(avatarUrl)
                  : AssetImage(avatarUrl) as ImageProvider,
            ),
            const SizedBox(height: 12),

            // Name
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            // Job title
            Text(
              jobTitle,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            // Social links
            Wrap(
              spacing: 12,
              children: socialLinks
                  .map(
                    (link) => IconButton(
                      onPressed: () {
                        LinkTool.openLink(link.url);
                      },
                      icon: Icon(link.icon, color: Colors.blueAccent),
                      tooltip: link.label,
                    ),
                  )
                  .toList(),
            ),

            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 20,
              endIndent: 20,
            ),

            // Archivements
if (archivements.isNotEmpty) ...[
  Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Thành tựu",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    ),
  ),
  const SizedBox(height: 8),

  // Dùng Column thay vì Expanded + ListView
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: archivements.map((text) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  ),

  const Divider(
    thickness: 1,
    color: Colors.grey,
    indent: 20,
    endIndent: 20,
  ),
],


              // Skills
              if (skills.isNotEmpty) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kỹ năng",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills.map((skill) {
                    return Chip(
                      label: Text(skill),
                      avatar: const Icon(
                        Icons.local_florist,
                        size: 16,
                        color: Colors.pinkAccent,
                      ),
                      backgroundColor: Colors.pink[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
        ),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final List<ProjectItem> projects;
  final void Function(String title)? onProjectTap;

  const ProjectWidget({super.key, required this.projects, this.onProjectTap});

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Projects",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // render danh sách
            ...projects.map(
              (project) => HoverListTile(
                icon: project.icon,
                title: project.title,
                subtitle: project.subtitle,
                onTap: () => onProjectTap?.call(project.title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDescriptionWidget extends StatefulWidget {
  final String projectName;
  final String youtubeUrl;
  final List<String> imageUrls;
  final String description;
  final List<String> features; // thêm list tính năng

  const ProjectDescriptionWidget({
    super.key,
    required this.projectName,
    required this.youtubeUrl,
    required this.imageUrls,
    required this.description,
    this.features = const [], // mặc định rỗng
  });

  @override
  State<ProjectDescriptionWidget> createState() =>
      _ProjectDescriptionWidgetState();
}

class _ProjectDescriptionWidgetState extends State<ProjectDescriptionWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayerController.convertUrlToId(widget.youtubeUrl)!;
    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Project name
            Text(
              widget.projectName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            if (widget.features.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tính năng nổi bật",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Column(
                children: widget.features.map((feature) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blueGrey.shade100,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.green],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.local_florist,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: 15,
                                  height: 1.4,
                                  color: Colors.blueGrey[900],
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],

            const SizedBox(height: 16),

            // Youtube video
            AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(controller: _controller),
            ),
            const SizedBox(height: 16),

            // Images
            LayoutBuilder(
              builder: (context, constraints) {
                final totalWidth = constraints.maxWidth;
                final itemCount = widget.imageUrls.length;
                const spacing = 8.0;

                final totalSpacing = spacing * (itemCount - 1);
                final itemWidth = (totalWidth - totalSpacing) / itemCount;
                final itemHeight = itemWidth * 9 / 16;

                return SizedBox(
                  height: itemHeight,
                  child: Row(
                    children: [
                      for (int i = 0; i < itemCount; i++) ...[
                        SizedBox(
                          width: itemWidth,
                          height: itemHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              widget.imageUrls[i],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (i < itemCount - 1) const SizedBox(width: spacing),
                      ],
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Features section
          ],
        ),
      ),
    );
  }
}

class KnowledgeWidget extends StatelessWidget {
  const KnowledgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Knowledge",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Thêm các dự án ở đây
            ListTile(
              leading: Icon(Icons.web),
              title: Text("Website cá nhân"),
              subtitle: Text("Mô tả ngắn về dự án..."),
            ),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Ứng dụng di động"),
              subtitle: Text("Mô tả ngắn về dự án..."),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgrammingLanguageWidget extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {"name": "Dart", "icon": FontAwesomeIcons.dartLang, "color": Colors.blue},
    {"name": "C++", "icon": FontAwesomeIcons.code, "color": Colors.indigo},
    {"name": "Java", "icon": FontAwesomeIcons.java, "color": Colors.orange},
    // {"name": "Python", "icon": FontAwesomeIcons.python, "color": Colors.green},
    // {"name": "JavaScript", "icon": FontAwesomeIcons.js, "color": Colors.yellow.shade700},
    {
      "name": "Kotlin",
      "icon": FontAwesomeIcons.code,
      "color": Colors.pink.shade700,
    },
  ];
  ProgrammingLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "💻 Programming Languages",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: double.infinity, height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: languages.map((lang) {
                return Chip(
                  avatar: CircleAvatar(
                    backgroundColor: lang["color"],
                    child: FaIcon(lang["icon"], size: 16, color: Colors.white),
                  ),
                  label: Text(
                    lang["name"],
                    style: const TextStyle(fontSize: 16),
                  ),
                  backgroundColor: lang["color"].withOpacity(0.15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class EngineFrameworkWidget extends StatelessWidget {
  final List<Map<String, dynamic>> frameworks = [
    {
      "name": "Flutter",
      "icon": FontAwesomeIcons.mobile,
      "color": const Color.fromARGB(255, 33, 243, 201),
    },
    {"name": "Unity", "icon": FontAwesomeIcons.gamepad, "color": Colors.black},
    {"name": "Spring", "icon": FontAwesomeIcons.leaf, "color": Colors.green},
    {
      "name": "ASP.NET",
      "icon": FontAwesomeIcons.code,
      "color": const Color.fromARGB(255, 187, 234, 249),
    },
    {
      "name": "Godot",
      "icon": FontAwesomeIcons.code,
      "color": const Color.fromARGB(255, 8, 148, 242),
    },
    {
      "name": "Blazor",
      "icon": FontAwesomeIcons.code,
      "color": const Color.fromARGB(255, 105, 0, 253),
    },
  ];

  EngineFrameworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "🛠️ Engines & Frameworks",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: double.infinity, height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: frameworks.map((fw) {
                return Container(
                  width: 120,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        fw["color"].withOpacity(0.8),
                        fw["color"].withOpacity(0.4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(fw["icon"], color: Colors.white, size: 28),
                      const SizedBox(height: 8),
                      Text(
                        fw["name"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class JobExperienceWidget extends StatelessWidget {
  const JobExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = [
      {
        "icon": FontAwesomeIcons.server,
        "name": "Nhân viên IT phần mềm",
        "description":
            "Phụ trách hệ thống quản lý dữ liệu nội bộ công ty Đài Loan có chi nhánh tại Việt Nam. Bảo trì và nâng cấp server. Quản trị hệ thống mạng.",
        "time": "11/2024 - 01/2025",
      },
      {
        "icon": Icons.phone_android,
        "name": "Mobile Developer",
        "description":
            "Phát triển ứng dụng âm nhạc trên mobile với Flutter, Android Native và Unity làm trò chơi tích hợp. Lập trình giao diện và hành vi tại client, kết nối với bên server để hoàn thiện ứng dụng.",
        "time": "02/2025 - 05/2025",
      },
      {
        "icon": Icons.computer,
        "name": "Game 2D Unity",
        "description": "Phát triển trò chơi độc lập với Unity",
        "time": "06/2025 - now",
      },
    ];

    return PortfolioCard(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "💼 Job Experience",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              children: jobs.map((job) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          job["icon"] as IconData,
                          size: 28,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job["name"] as String,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                job["description"] as String,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                job["time"] as String,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (job != jobs.last)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(thickness: 1, height: 1),
                      ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItem {
  final IconData icon;
  final String title;
  final String subtitle;

  ProjectItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
