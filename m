Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36D6D4CEB
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 17:59:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B70BC6A610;
	Mon,  3 Apr 2023 15:59:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D88C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 15:59:33 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CAD2FF808;
 Mon,  3 Apr 2023 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680537573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxzAESz2itDatQ0g4Gg/O8O4nZ6xBxSu0J0zCMfdfVI=;
 b=UEulIjSPWvrG4xKO+EsYpQG7wm/RETkk/NF4U9FqG5BeatPS1smcKB4ReIS4Cr80SuJsQz
 jQsNlPtcEnHgZKp/eQjpEdJdX6R/1x3Gq93kD9xPuGoUelcom2n9nsh3R6dvfrb3YJULNA
 L39IunvtJK2lKoqJe48mv6X1k7Orwh/WOlHi8LwNMjwBHIcfiLifNOoznjWsmQD62r8wV0
 XYOidDqFnvIZtubqH0TjsGAkCaFkXSssElf2WHGdm+R5pyWouLJyCppYi/4tGF4GZcxMUR
 mlkqIFQCMdecXXOxbW1ecIDMjubAIChU3DfbsbJrZbb2fZImxD+J7NJEx38DYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Date: Mon,  3 Apr 2023 17:59:29 +0200
Message-Id: <20230403155929.137657-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328155819.225521-2-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f71e0e329c152c7f11ddfd97ffc62aba152fad3f'
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] mtd: rawnand: stm32_fmc2: remove
	unsupported EDO mode
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

On Tue, 2023-03-28 at 15:58:18 UTC, Christophe Kerello wrote:
> Remove the EDO mode support from as the FMC2 controller does not
> support the feature.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Cc: stable@vger.kernel.org #v5.4+
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
