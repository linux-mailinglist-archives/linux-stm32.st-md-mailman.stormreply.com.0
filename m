Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA6730183
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 16:18:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E070AC6A617;
	Wed, 14 Jun 2023 14:18:46 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36B12C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 14:18:46 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-30fc50d843aso2418569f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686752325; x=1689344325;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=D3tehYIm42xn6IneOOUeBNA/YtuO2mEylaC1sAfhrzI=;
 b=pU9p/PHcW4EsK4HI7C5OpL+/n1Mn6H404jyLHg0b55qfoKipiYScehY0aLEjPsNE0n
 hTlAz8k5Rq6Sgd0xei3LeFy/g7cAqrIfR4IYefBVLbHEgcXvijHeiatZgfFOieS0bCME
 K1Wevs/OjMqlH+dFmK6L1Cauctwt7xGQc+BNVPx/CXrTHDKwY7EoCwvsNKMPzmepDS8C
 vC7uh8/cq6UXkbRB+/K3u/RTckdHIqJQdhQPXCNZQ3Nc9u2NAn54+3wM2ibzIlUTkcOE
 6GtRYuNkuCWx8BrwOtzN0/AKQHHtT4ojATlCc1kGePM2JCGNwpBxdtMQarey34Xt2GJG
 fbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686752325; x=1689344325;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3tehYIm42xn6IneOOUeBNA/YtuO2mEylaC1sAfhrzI=;
 b=DkBBYylTrkOuKV7GU1izOTPxUTo6M6tVpCIlMFU/tMSkrxdOdW9pzAGdxYdgamVDjv
 BTBqhHmfKp7JedtscVZyDzeSbemtv3MlP22x3IvNJOoS2CxpPG7PSZv9LJKa0Kwhr55+
 uSg56IpqNJpF/2Sdd/74o/UFQt/wUn9wygTOd3HBBOvYMRQM1ZIvKT4jBObJXIhPWQcU
 mu7v9YkH0MSbyISMVMhswtP6vCvNPWSVI0/W1CWG6XrXyZ4wP1ld18wSsTPq8BUQHjYV
 SYJFmOW8i5UuN0LRTFY50DFnPw/Cxa2yTFGVHgbZwNfAQGFqPCUQniJHn3hJh5sD3AaC
 IaDQ==
X-Gm-Message-State: AC+VfDx4lpKAcXgZoILMyHzAYjdKQaGo1MOs2kunewhsVisRb1xTU+g0
 0UTt/Et1AERGtEzhVs/NlBDyBld06cQ=
X-Google-Smtp-Source: ACHHUZ7CFktIQYnBooUgoy/VmvR6/Rx8dLtSqGFHp4FzXcBUDcuL4zzpl28fyUyL+ErrtInzpeg6Dw==
X-Received: by 2002:a05:6000:1:b0:310:c670:d110 with SMTP id
 h1-20020a056000000100b00310c670d110mr1812627wrx.13.1686752325455; 
 Wed, 14 Jun 2023 07:18:45 -0700 (PDT)
Received: from Ansuel-xps. (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b003110dc7f408sm1433466wrr.41.2023.06.14.07.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 07:18:44 -0700 (PDT)
Message-ID: <6489cc44.5d0a0220.47312.6e31@mx.google.com>
X-Google-Original-Message-ID: <ZIltpnzbNda7Inq9@Ansuel-xps.>
Date: Wed, 14 Jun 2023 09:35:02 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
References: <20220723142933.16030-1-ansuelsmth@gmail.com>
 <20220723142933.16030-5-ansuelsmth@gmail.com>
 <DM4PR12MB508882D5BE351BD756A7A9A4D35AA@DM4PR12MB5088.namprd12.prod.outlook.com>
 <64898745.5d0a0220.546a.a6f1@mx.google.com>
 <DM4PR12MB508899B25BA18E2E53939BE7D35AA@DM4PR12MB5088.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR12MB508899B25BA18E2E53939BE7D35AA@DM4PR12MB5088.namprd12.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [net-next PATCH v5 4/5] net: ethernet: stmicro:
 stmmac: generate stmmac dma conf before open
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

On Wed, Jun 14, 2023 at 01:48:40PM +0000, Jose Abreu wrote:
> From: Christian Marangi <ansuelsmth@gmail.com>
> Date: Wed, Jun 14, 2023 at 03:16:08
> 
> > I'm not following the meaning of leak here. If it's intended as a memory
> > leak then dma_conf is correctly freed in the 2 user of __stmmac_open.
> > 
> > stmmac_init_phy also doesn't seems to use dma_conf. Am I missing
> > something here?
> > 
> 
> Sorry, I should have been clearer: It's not leaking the dma_conf per-se but
> the contents of it: The DMA descriptors. Since the memcpy() is only done after
> init_phy(); if init_phy() fails, then stmmac will never free up the DMA descriptors.
> 
> Does it make sense?
> 

Thanks for the clarification! Sent a follow-up patch that should fix the
possible leak. Would be good if you can also test it for a Tested-by
tag.

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
