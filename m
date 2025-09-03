Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD7B41ACF
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:57:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCBD4C3F95F;
	Wed,  3 Sep 2025 09:57:31 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96174C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:57:30 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1756893449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0FyGGHWcDrgxz10Urh5OV1MMiUdH5HDCFT5DAmKvuI=;
 b=WWOeJ/esyFTr51QXP37ODlRH7ABL2Yen4uDulWpqlXI2IGmDGm4I5x2S6ArN6tgwkjemKp
 4hBP4TGK/P4Uurbs9941mrBz1+dy+UNFnGx8oZ69cimD8tqbee3vuzSEFD49zIrr69kSJy
 zxT5mzLLVXsr1OWKlGXN0DOtnG1+dH8YPW/n1jjXB3OFwhgTHkqBktmtdyWquQtxGm6pt3
 VrY74UKlTx057usWdP7FljDaQYVYQUwFMEE1WTRsX+nSVHJNAd3iqS114CHlf9CnEpUD3b
 SxVe/wOysR0+aGuuxLE1t6Qcu9NgoVXiyORMyv/bKuSASPh+wZMIPkZ4eDhDhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1756893449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0FyGGHWcDrgxz10Urh5OV1MMiUdH5HDCFT5DAmKvuI=;
 b=bm7kR/26YIrTFvAFsmmUReGzi+ASqn5d2A6PPqovQGU7SfvAv39Ti03OsNUqWaclyOJbNw
 HEWw2SzRe2QcZsDA==
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20250901-relative_flex_pps-v4-1-b874971dfe85@foss.st.com>
References: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
 <20250901-relative_flex_pps-v4-1-b874971dfe85@foss.st.com>
Date: Wed, 03 Sep 2025 11:57:28 +0200
Message-ID: <877byfzwmv.ffs@tglx>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] time: export
	timespec64_add_safe() symbol
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

On Mon, Sep 01 2025 at 11:16, Gatien Chevallier wrote:

> Export the timespec64_add_safe() symbol so that this function can be used
> in modules where computation of time related is done.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
