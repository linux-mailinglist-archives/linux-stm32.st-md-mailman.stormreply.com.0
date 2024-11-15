Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 901119D4187
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 549D9C7A850;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA35C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1731688325; x=1732293125; i=parker@finest.io;
 bh=X5FKveEGFoRtJToEkzkSd7Mwk8gc6fAM/LYYJdowFdM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KfE+ZoVJrzgHUkqYMokK6Euaw4ywuIeNeOLTNCJjmgdeU+k1252QIw9LNYTY8im+
 zEW+pit0E+FH/9T3lEZI8wTjqAeQ0FMZiWKAgUzLLvjUqNvpaAwvXVjocOiJnqNYU
 +YbUY5IRFprQA13XLV4g3ZgTmrFnzrfg5SAx8b5a3yZVhKt2aplieOCuCMEMdGgYJ
 2uKzINzqxRAKkW7Ksr8pnarTMtJcwcLzxkXJCnDEvtOZqINhV1CMtCm2SXGCFlpXL
 A7pHy6jjUSJPsWuso63m9tvOXhISs8JxMrA56SWg1UtvIrr53731UZuAYHzwKgTUk
 8XPwj1ij8Ywebo+lTA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from finest.io ([98.159.241.229]) by mrelay.perfora.net (mreueus002
 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MDzNh-1sz0p93pR1-00GdLZ;
 Fri, 15 Nov 2024 17:32:05 +0100
From: Parker Newman <parker@finest.io>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 15 Nov 2024 11:31:07 -0500
Message-ID: <cover.1731685185.git.pnewman@connecttech.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:VmMzWfMuiUIonudG8UECAGKTtEGicIuJhmmOO1QaBA8Qx1KyLJB
 wEy22iYL30pHd39L68ZkWkpgK3f91L6r7nr17yp6487cxmF8x797lm+/A2kSN+nUJeDFU0f
 TUu07BRkGBlZRFr92mVbbQt0b42wwSutsA6gHHnyYkhIdLRDQCmtwivXqtNG4TKsA8V7eWZ
 vWDhDZwGpz4iZXHdUFetQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xwSDuaQ0gg8=;anf8cpo65zssXb+qsXoVC7Gn4ZT
 z6T42O9ZoV7+aLb7gPqddT/uK1LNOz+3IKggCrdMLZF+Pt4qf5/q1JCJ4ZKgIGGLXNyGeRNLl
 W+LEy39cb0VVUw60tPQaTgh5V0iRepbK3kzf3aMqaUejTgwitiX0nrA68z0nwQKbK5HsE6Y+u
 JlGnDTvwt1HfQwT8Jyhh5GXnKMjzGHrkanu7U5T8Rp1cwowA74iNssF2aNVxPg+YjdB2ZqP9w
 o/DuFwU1BjDObwuU8Rn6uEJ2hfMGCQ5KrYMktudss14g8RHjDoeo+713WCYS6eKiwTg6gjn7H
 JNjcPNbrRflwID4vvZEH0gRFfNeIGUkfzDZvoKYDQe6bnOHql2mfQ9rYoP6WNV0sP+Fs2yMYW
 Lb0dAPxYfL2IVUU8NKolroSAaxr0ierboIEDlEUj+qPfzJQ7lq40NN1rcxSIeyibnJReKoB5O
 PeT26HKnk85EZ9PNZIm6LmqL3SUxQsTbfH1eeXoyudE/dN4bsShrBb9XKhymDHwbQheLRXIG5
 wFzA5PIZV54GPM6tlfU/jk1hdZUwEr2UNV9LVmVGVuBr9Vf6QOcg58hTb2V+b3YdKjSDiQ5un
 VmMofI4/cFjOPsULZ+yD7SBaOY9prvZYU9AZDOs1aGRNFHbE+QEO2n343fIRVBFrGhwFSJdZL
 Q7+MAna4HmeX3hxyW++tbx+bOTM1rNJF2Ro6glHgW0JcfiHOCiJcTexRoFQ87uvyBuET8f0em
 CGctAqmm3ayJMCPFYh0eM22gfEArvVZZq+PyQ/kOENNPdgKhFnyRCVPDKBYt1I+AkvdU6K3hz
 5pUyLd7tg16fvqr5MsjW87SGCVQI64a9XqmJbm222/SgKi6mJ0Qt6yKor02D3um8xO
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Parker Newman <pnewman@connecttech.com>
Subject: [Linux-stm32] [PATCH v1 0/1] net: stmmac: dwmac-tegra: Read iommu
	stream id from device tree
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

From: Parker Newman <pnewman@connecttech.com>

Nvidia Tegra MGBE controllers require the iommu "Stream ID" (SID) to be
written to a register for proper operation.
The current driver is hard coded to mgbe0's SID, causing the other mgbe
controller instances to not work.

This patch enables the other mgbe controllers by reading the SID from the
iommus property in the device tree using the existing
tegra_dev_iommu_get_stream_id() function in linux/iommu.h.

Parker Newman (1):
  net: stmmac: dwmac-tegra: Read iommu stream id from device tree

 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: 37c5695cb37a20403947062be8cb7e00f6bed353
--
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
