import 'package:flutter/material.dart';
import 'package:portfolio/elements/portfolio_card.dart';
import 'package:portfolio/tools/link_tool.dart';

class PortfolioWidget extends StatefulWidget {
  const PortfolioWidget({super.key});

  @override
  State<PortfolioWidget> createState() => _PortfolioWidgetState();
}

class _PortfolioWidgetState extends State<PortfolioWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        child: SingleChildScrollView(
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
                  ),

                  const SizedBox(width: 24),

                  Expanded(child: ProjectWidget()),
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

  const ProfileWidget({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.description,
    required this.avatarUrl,
    this.socialLinks = const [],
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioCard(
      width: 400,
      height: 600,
      elevation: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
        ],
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key});

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


