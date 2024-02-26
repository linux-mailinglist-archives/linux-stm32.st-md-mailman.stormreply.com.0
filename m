Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A48671B5
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 11:44:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C09C6B46B;
	Mon, 26 Feb 2024 10:44:44 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15286C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 10:44:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32E2D24000A;
 Mon, 26 Feb 2024 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708944282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/jayUSRVjpybZD3WxWT1q4xekLKiFI7st5oYv5V+jg=;
 b=DDrCoXDe3eXuMjrtasnZepDNu5tAKDw6NduQOARdFQTp/RU2aOKzoJrkm5DDaOLzLYanzf
 uGtLN7yJtowil+EvApOjaxjqROfc9OKN7G8V3frxG2TeGjnvD0G1cY2h3jjN0XttEfcvXV
 jjlied8vSz68+prRMHlV2ep86a2sFFuAtDQ9CHIVM5A86YFyr64uYCGcrpBAIAZAzBlsR1
 PGpcFtLQs/Gy2jLp8vMfQRSmg0F5t5kpi5jMeNVfFkUs3zgeM8N+Yr/6sbho+3pSgi9SSC
 qYYO8cT6s1ThAvUOaRKdoG6Pnjp67LkLvU+JnFyLlbtccmRyc9phIUvcJsZMlA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Date: Mon, 26 Feb 2024 11:44:41 +0100
Message-Id: <20240226104441.489887-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219140505.85794-4-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0bfad3b3561d6f219b768d2a4265642ee9d31b1d'
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 3/3] mtd: rawnand: stm32_fmc2: add MP25
	support
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

On Mon, 2024-02-19 at 14:05:05 UTC, Christophe Kerello wrote:
> FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
> available when on MP25 SoC, the 4 chip select are available.
> 
> Let's use a platform data structure for parameters that will differ.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
