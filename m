Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528014BBAAB
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 15:33:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E4FC60474;
	Fri, 18 Feb 2022 14:33:10 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60D47C6046E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 14:33:08 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9DFCA10000D;
 Fri, 18 Feb 2022 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8wreGlX9R9giHg9TtUZfMq1UzO5U2luCRSST3Eos5A=;
 b=PGeF6w9lBkT1hVEhEqQt/p7nOYy2rD2ee18sQ0smT3QRM0pbn3dBzpxRzQMp3L/QTwpKNS
 /m7RrOnm2IiqPOzBpG7O2a0bnQVRCI8+v94LwjRgZhr0g4dsyPAy6aJfZ9GlQAAnh/PanX
 wdlsX26q/F2+DNz5DQz2Dy8QbldHzxpf4v0Le6pYC+egD5qwRaiSmnD5iKHI/GmRYLcumG
 QkNq53+GA+Nc4QjD3tGSY6sdAeUGMo0CxTSVPZEnC1flmx0/zDwkQLNV1bs0Y1SjxaebtR
 3trvHTIkc70ZyPM2hbeNTXVVK7+Rer4X/2TrmpAeR9WqNmkBwbSZSFubUfKzIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, p.yadav@ti.com
Date: Fri, 18 Feb 2022 15:33:06 +0100
Message-Id: <20220218143306.322284-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220217144755.270679-2-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cb57fae479be41d1233f5a49d4760de9a5692b6e'
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-binding: mtd: nand: Document
	the wp-gpios property
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

On Thu, 2022-02-17 at 14:47:52 UTC, Christophe Kerello wrote:
> A few drivers use this property to describe the GPIO pin used to protect
> the NAND during program/erase operations.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
