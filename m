Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C2A15B577
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2020 00:54:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC898C36B0B;
	Wed, 12 Feb 2020 23:54:50 +0000 (UTC)
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.144.97])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64375C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 23:54:48 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 57C4018034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 17:54:47 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 21qBjmhf6XVkQ21qBjAn65; Wed, 12 Feb 2020 17:54:47 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t8u2HZ0HT5+/SCewfd6rUWGx4Yw1GUSodEHJxdPQKF4=; b=azvhQhwBDDmuyVDI/uM62r+9SM
 BOEAVq7UOdExmHQCPBOb4acQEgMhNNFOnHgA2gOnuCuqhSimmn5sOJY+H5kZmdOS/LwtwLwMbYmzV
 rle1j8TAsLJZg+ct7qgPr6kPlBGbOm7gRau1quVzOjOzE3ODCHSWpPVtARzAQ5KSn/1YqCnAr97sI
 6E1h/wdDdXSKx3C15KGrSQ5NJoVMJjAjlwPQX4VlAjCerx9SpI8vKYqfkjC1Ssi241jxPf5QY3JWO
 1biH+LPt70wlF5MdCLLNaHPH11xkitdQizVnrW5A2JzqMOM3RgWAQWcBtWbyYfC6cNi/smj7PKDRp
 0E6aCF6w==;
Received: from [200.68.141.42] (port=1531 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j21q9-003KPE-9T; Wed, 12 Feb 2020 17:54:45 -0600
Date: Wed, 12 Feb 2020 17:54:43 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20200212235443.GA18334@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.141.42
X-Source-L: No
X-Exim-ID: 1j21q9-003KPE-9T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.141.42]:1531
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stm class: Replace zero-length array with
 flexible-array member
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwtracing/stm/policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/policy.c
index 4f932a419752..603b4a9969d3 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -34,7 +34,7 @@ struct stp_policy_node {
 	unsigned int		first_channel;
 	unsigned int		last_channel;
 	/* this is the one that's exposed to the attributes */
-	unsigned char		priv[0];
+	unsigned char		priv[];
 };
 
 void *stp_policy_node_priv(struct stp_policy_node *pn)
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
