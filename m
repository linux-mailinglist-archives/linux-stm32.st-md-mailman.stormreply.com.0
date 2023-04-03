Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFF6D4CE9
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 17:59:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F5C7C6A610;
	Mon,  3 Apr 2023 15:59:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A6E8C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 15:59:26 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AAD21E0005;
 Mon,  3 Apr 2023 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680537566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPOb2oJsLReltUpfhtCHFxjUhpwGqcY6PIdWLBKJAPE=;
 b=NIGQ37EycIDn6wmQSD51ITrZrfmKW/tzuF8bQQk6WmEmjSZec7Rtbhd0rjAZJrDnOHvY+M
 jQjKqI1Gi9AQ43sGVz0+MABRB6w6DMOmJTHmMiUwcaeWcWLRzwW1i3nGzsdq/nEfQOfNAt
 MyBbb+O3VvMgyFCcUqJBNPSi2C3DNXxnuJLSl4kXkIR9PgKfUv8Ugx27rjq7FzE+AXHWmo
 CpdQGR91MUB4NMpshreFaf7MmcnmO6kSNCPH+gJFnDArDxCcSDnRgc+Ly9/Ar1vkBssmiu
 svnrJs4gbnWPBnzrNinXymR3lZwsf50dvSFWgcCd9+ED1/XU3FUAOXugdlFbRQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Date: Mon,  3 Apr 2023 17:59:21 +0200
Message-Id: <20230403155921.137622-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328155819.225521-3-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ddbb664b6ab8de7dffa388ae0c88cd18616494e5'
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/2] mtd: rawnand: stm32_fmc2: use
	timings.mode instead of checking tRC_min
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

On Tue, 2023-03-28 at 15:58:19 UTC, Christophe Kerello wrote:
> Use timings.mode value instead of checking tRC_min timing
> for EDO mode support.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Cc: stable@vger.kernel.org #v5.10+
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
