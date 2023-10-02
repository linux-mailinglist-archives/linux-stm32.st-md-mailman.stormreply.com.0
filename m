Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D587B6C6C
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D905C6B478;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09B6CC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 13:54:45 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-7743448d88eso792631585a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696254885; x=1696859685;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=STxM7vkkmDyUmxUH+gQAbgTWzPPiXJaAVUcK/e9j1i4=;
 b=FQfGmjHa85zz7qFcuEEVreISYyy7zUfxaYEghL3v5Rjdxf/wmlfmqoI40MjUlLabyf
 7CojN81QsHA60lZ2iGdxobqgNe6mkCJ2Zm9voWJ8XES7nGFp8UxJVULKLIIH/93LvCYg
 FX7gec0rbpMPdD3UfI+YzI26NcERNbIyynF4tsZ0XmXR3n6pfnZuThvIWZVuBZdI6eUl
 cmdHNgokh/w52MnqDKMX+boy04I2eIBS8RKwRNCvtLjX2qsfes4C9Zug56FySuvBZVTr
 HR2xnloj855wZI3DTLipvutuxZ8KFK5aTPEO5nQlJ19nRKBYVEK9Zn1Fk+xamT816Zkh
 rfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254885; x=1696859685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STxM7vkkmDyUmxUH+gQAbgTWzPPiXJaAVUcK/e9j1i4=;
 b=L2RnoyN1dBu+E++4+aPi54E0e/voiV7rByUs79OWg5/g/bgtzKBIjxlcq59Dpu0GHB
 1PmYcB9I7Xq2IxOSGDIwoUvPh5Fym4ey70RP3IZ4fA0zm4R0UeDuEPMvuOqmhySkOyAQ
 GYjDCDDtx0u8NHZ8Ne4sbBj3AHWaLnJFMkzLYESHAlb/FcyjqvmccoFLb1AutuVTGhiL
 stqJVwAwwZ2W60dQlTIzisiRpdIAqekokNfYXky9sOMkGHeTsprDWBJny5B6+0LVohxO
 aaf+O/+TXK3CrX5nDvz9mA3aZwMMBCR13ZlQSife93hYD2lAUNes6dMnVASvD4gYJ3Sg
 lMNA==
X-Gm-Message-State: AOJu0YxOPKERsUF5o0HiKBv2DZ2K+Mtsuj+vZUSfMy6tyvzfll1P0+Q1
 d45NKmxS4t8vKK2PxNnmlD8dfw==
X-Google-Smtp-Source: AGHT+IEs4NNprUgXOj7mVjG0S6MI/X0bgLI21KGJ4S6Xc/WbrCRFCrApaXSxBK8zWzz0pDpmlfRmAA==
X-Received: by 2002:a05:620a:12f1:b0:774:13e:71cd with SMTP id
 f17-20020a05620a12f100b00774013e71cdmr10622494qkl.56.1696254884697; 
 Mon, 02 Oct 2023 06:54:44 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 h8-20020ae9ec08000000b0076e672f535asm8922296qkg.57.2023.10.02.06.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 06:54:44 -0700 (PDT)
Date: Mon, 2 Oct 2023 09:54:34 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <ZRrLmjxoIIx7pIcs@dell-precision-5540>
References: <20230927175749.1419774-1-ben.wolsieffer@hefring.com>
 <681cc4ca-9fd7-9436-6c7d-d7da95026ce3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <681cc4ca-9fd7-9436-6c7d-d7da95026ce3@intel.com>
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-stm32: fix resume
	on STM32 MCU
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

Hi Jacob,

On Fri, Sep 29, 2023 at 10:48:47AM -0700, Jacob Keller wrote:
> 
> 
> On 9/27/2023 10:57 AM, Ben Wolsieffer wrote:
> > The STM32MP1 keeps clk_rx enabled during suspend, and therefore the
> > driver does not enable the clock in stm32_dwmac_init() if the device was
> > suspended. The problem is that this same code runs on STM32 MCUs, which
> > do disable clk_rx during suspend, causing the clock to never be
> > re-enabled on resume.
> > 
> > This patch adds a variant flag to indicate that clk_rx remains enabled
> > during suspend, and uses this to decide whether to enable the clock in
> > stm32_dwmac_init() if the device was suspended.
> > 
> 
> Why not just keep clk_rx enabled unconditionally or unconditionally stop
> it during suspend? I guess that might be part of a larger cleanup and
> has more side effects?

Ideally, you want to turn off as many clocks as possible in suspend to
save power. I'm assuming there is some hardware reason the STM32MP1
needs the RX clock on during suspend, but it was not explained in the
original patch. Without more information, I'm trying to maintain the
existing behavior.

> 
> > This approach fixes this specific bug with limited opportunity for
> > unintended side-effects, but I have a follow up patch that will refactor
> > the clock configuration and hopefully make it less error prone.
> > 
> 
> I'd guess the follow-up refactor would target next?
> 
> > Fixes: 6528e02cc9ff ("net: ethernet: stmmac: add adaptation for stm32mp157c.")
> > Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> > ---
> 
> This seems pretty small and targeted so it does make sense to me as a
> net fix, but it definitely feels like a workaround.
> 
> I look forward to reading the cleanup patch mentioned.

Sorry, I should have linked this when I re-posted this patch for
net, but I previously submitted this patch as part of a series with
the cleanup but was asked to split them up for net and net-next.
Personally, I would be fine with them going into net-next together (or
squashed).

The original series can be found here:
https://lore.kernel.org/linux-arm-kernel/20230919164535.128125-3-ben.wolsieffer@hefring.com/T/

Thanks, Ben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
