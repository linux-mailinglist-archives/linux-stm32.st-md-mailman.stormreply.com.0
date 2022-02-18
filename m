Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 551114BBAAA
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 15:33:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A113C60474;
	Fri, 18 Feb 2022 14:33:05 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87436C6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 14:33:03 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F401B100002;
 Fri, 18 Feb 2022 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IF+bBotb8aWY1Kt+8zVVFsrxJD/Qv2pWkySdFRv0E2A=;
 b=UUQl85JcyGBt47wLgD57UsAYqU8DebleUhgDNJs5+u1WzG9uV0IxVeUh+eiWFXC7I55332
 S2HIrAb88CM8z5IqavD0fFygRI2Rb9LeHGB5iYNfztGhJ3zi+0AQkf2sj7sPggw8ZLkEnt
 UeKWszGs5WzG5ux77IhBoPMVxqn2n1hUwRXi49YUyl1svtg5e/znT5cq0hyGwO5FpasbFp
 G+DE4ETy+9IpKkQDbyAN8gl9F9RwRYrDfCg2azGWwH6ceRDR2nfLcTzurKYOQp//TgfsDm
 EP5TFzr34OaXVmBF++UuS/VvPVE2KCytwT/ir2l5PTPqG9JieFbZ/zLNw3W3Sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, p.yadav@ti.com
Date: Fri, 18 Feb 2022 15:33:00 +0100
Message-Id: <20220218143300.322209-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220217144755.270679-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ffb16c1c42670356c579926aabdac0ac7bbc16d8'
Cc: devicetree@vger.kernel.org, chenshumin86@sina.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/4] mtd: rawnand: stm32_fmc2: Add NAND
	Write Protect support
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

On Thu, 2022-02-17 at 14:47:53 UTC, Christophe Kerello wrote:
> This patch adds the support of the WP# signal. WP will be disabled in
> probe/resume callbacks and will be enabled in remove/suspend callbacks.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
