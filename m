Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA79D4173
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F82C78F6B;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com
 [111.22.67.135])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBBD2C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 01:45:12 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
 by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee3672c1ba4e71-b1691;
 Thu, 07 Nov 2024 09:45:11 +0800 (CST)
X-RM-TRANSID: 2ee3672c1ba4e71-b1691
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea672c1ba6fbb-49cd9;
 Thu, 07 Nov 2024 09:45:10 +0800 (CST)
X-RM-TRANSID: 2eea672c1ba6fbb-49cd9
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: olivier.moysan@foss.st.com
Date: Thu,  7 Nov 2024 09:45:10 +0800
Message-Id: <20241107014510.211654-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
References: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: luoyifan@cmss.chinamobile.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm: Prevent potential division by
	zero in stm32_sai_mclk_round_rate()
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

Sure, I can submit a new patch with specific tests and error messages added to stm32_sai_get_clk_div().



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
