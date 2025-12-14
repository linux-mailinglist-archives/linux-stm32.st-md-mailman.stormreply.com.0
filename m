Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B6CBBE0B
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Dec 2025 18:49:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 516C9C58D77;
	Sun, 14 Dec 2025 17:49:17 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C14C1A97B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Dec 2025 17:49:16 +0000 (UTC)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id UqDZve9EWBoKRUqDZvZY3L; Sun, 14 Dec 2025 18:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1765734556;
 bh=8bTXwwa4yWYmr7RPK5yqMVybpKLz/hsRLqe6vIgI6FU=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Q0aUFhZlMIAYVtUpnB+Yt+5owMGpqikBvZS7AsEeLg0ZwIqPl5FDLwFkoGjxkdNmX
 l094Y+/3wL5Ea+GwsjU803rk7oHa/EYRxtETrOrrR45WwlvdDZ/xBHNzBJ0l5hUqJo
 JWY7cSecI32YgqE56n7HGKUlLnTvgnBgzSlyYquaQE93RD8ZiPFRRpsU5ZcrVglciA
 HHnJtn0WGrbLxYxyZrbLK+X27jcyc3miJdZbZUklHf4vJNTU9IV4qcnn49VIq+cNYn
 PgvZxFGi4zPiKWOA5/i/sP5ozpNyQPPF3MUnJ+jpLevSqOR0nvi1l6X72PhVno7dGd
 2MNYZRVzufp2A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Dec 2025 18:49:16 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 14 Dec 2025 18:49:09 +0100
Message-ID: <b5811c1c5efdc6e9c8eb4886b8046b50b09c37f0.1765734533.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] stm class: Constify struct
	configfs_item_operations and configfs_group_operations
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  11786	   4216	     64	  16066	   3ec2	drivers/hwtracing/stm/policy.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12202	   3800	     64	  16066	   3ec2	drivers/hwtracing/stm/policy.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/hwtracing/stm/policy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/policy.c
index 42103c3a177f..a1af8d585fc9 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -181,7 +181,7 @@ static void stp_policy_node_release(struct config_item *item)
 	kfree(node);
 }
 
-static struct configfs_item_operations stp_policy_node_item_ops = {
+static const struct configfs_item_operations stp_policy_node_item_ops = {
 	.release		= stp_policy_node_release,
 };
 
@@ -270,7 +270,7 @@ stp_policy_node_drop(struct config_group *group, struct config_item *item)
 	config_item_put(item);
 }
 
-static struct configfs_group_operations stp_policy_node_group_ops = {
+static const struct configfs_group_operations stp_policy_node_group_ops = {
 	.make_group	= stp_policy_node_make,
 	.drop_item	= stp_policy_node_drop,
 };
@@ -364,11 +364,11 @@ static void stp_policy_release(struct config_item *item)
 	kfree(policy);
 }
 
-static struct configfs_item_operations stp_policy_item_ops = {
+static const struct configfs_item_operations stp_policy_item_ops = {
 	.release		= stp_policy_release,
 };
 
-static struct configfs_group_operations stp_policy_group_ops = {
+static const struct configfs_group_operations stp_policy_group_ops = {
 	.make_group	= stp_policy_node_make,
 };
 
@@ -466,7 +466,7 @@ stp_policy_make(struct config_group *group, const char *name)
 	return ret;
 }
 
-static struct configfs_group_operations stp_policy_root_group_ops = {
+static const struct configfs_group_operations stp_policy_root_group_ops = {
 	.make_group	= stp_policy_make,
 };
 
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
