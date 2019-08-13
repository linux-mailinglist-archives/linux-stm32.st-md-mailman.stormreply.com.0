Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D388C36B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2019 23:16:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25C1DC35E02;
	Tue, 13 Aug 2019 21:16:00 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C383C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 21:15:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r21so80953931qke.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=g+FpJP8gBbZWmM9Jqyi9vV5lK5B2mjtQCZeza+rHOUI=;
 b=mnRfRzYsZiGjp47KRtGKlHBGA36nTtylkwSHBxJHfaeUo/Sah0sllmvLMrYsec12QI
 TbMSq39+as4FZTGOjVHyzRE19U2pzTjXMzvd5QQ/0yN7se8LtcJ3i8BZU3SDqWvIFund
 MROZIhtNFh+R4AxkG7a0mwarOukn8JpqLIE/lz2e07GGCuEY81/9LUDb8O7+xwhohRXz
 BzZfteZeTTRv/Fcp9qr2iwHpZVVwu6SM9vDjbvJFiawqmDi7CtzrbdCdotvXVaYn2k1B
 CRDcFBIgLJdkqQ/4eNVvvXIChbs7ACSI581JFgaloSifOW458D0YXs40tHKp2Fa7/cwH
 cFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=g+FpJP8gBbZWmM9Jqyi9vV5lK5B2mjtQCZeza+rHOUI=;
 b=uIdQRH0mjOSOGX085Vu/S5JFNlzxoBBs1UqXLp3Tv7vG2Ap9LBQV8uH7bj9hDlEtSQ
 nnfc8OzHPZ69CNGvtUP7k8w8X84YKAZiJZ5BmkCor3vkDfnjtvEkbWuLMC1jA2Mt3FE6
 pvJ+Mhd/Ubwjc8BV1IOdzTEV6XpR1+7TmfP5B357/I19mtdcGAaLUMDOkjbIibFYj9uE
 knHjr1tY/wC4h/YMMa5Z6NQ9tbsgA6aEHBmwWHM7PZ/LxDuSrepQntEtv+5OAXWXkIXZ
 jAj80CuM+vNJaSQuPR68+izEwDighsLyVOLNlz716MK0/KHkw62LLhpmE9YzDAVoS/AW
 lfIg==
X-Gm-Message-State: APjAAAVeCLAGEUzdYG8ONOrioLI45XbrWvopkF3vsja6KIqixtWZ/XKS
 tKcm4vade3i+int/WRDT7q1Z/A==
X-Google-Smtp-Source: APXvYqwcfHWVRIjsxdyiMoeWFbQw2UVBZzJyGRCgvOz8a+h9ytPvvWOkW09ipwxREnzq3TcTZjbi5Q==
X-Received: by 2002:a37:6ca:: with SMTP id 193mr36340194qkg.389.1565730957943; 
 Tue, 13 Aug 2019 14:15:57 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id z33sm49792013qtc.56.2019.08.13.14.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 14:15:57 -0700 (PDT)
Date: Tue, 13 Aug 2019 14:15:47 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190813141547.2d579090@cakuba.netronome.com>
In-Reply-To: <BN8PR12MB3266B9314CF13A9140A72354D3D20@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1565602974.git.joabreu@synopsys.com>
 <cover.1565602974.git.joabreu@synopsys.com>
 <6279e35421e17256ac023227ec8cd5c8498d34d0.1565602974.git.joabreu@synopsys.com>
 <20190812.140618.1288127671943783439.davem@davemloft.net>
 <BN8PR12MB3266B9314CF13A9140A72354D3D20@BN8PR12MB3266.namprd12.prod.outlook.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"linux-stm32@st-md-mailman.stormreply.com\"    <linux-stm32@st-md-mailman.stormreply.com>,  " linux-arm-kernel@lists.infradead."org," "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
	David Miller <davem@davemloft.net>, <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 04/12] net: stmmac: Add Split
 Header support and enable it in XGMAC cores
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

On Tue, 13 Aug 2019 08:30:47 +0000, Jose Abreu wrote:
> ++ Jakub
> 
> From: David Miller <davem@davemloft.net>
> Date: Aug/12/2019, 22:06:18 (UTC+00:00)
> 
> > From: Jose Abreu <Jose.Abreu@synopsys.com>
> > Date: Mon, 12 Aug 2019 11:44:03 +0200
> >   
> > > 	- Add performance info (David)  
> > 
> > Ummm...
> > 
> > Whilst cpu utilization is interesting, I might be mainly interested in
> > how this effects "networking" performance.  I find it very surprising
> > that it isn't obvious that this is what I wanted.
> > 
> > Do you not do performance testing on the networking level when you
> > make fundamental changes to how packets are processed by the
> > hardware/driver?  
> 
> I do.
> 
> In my HW this feature does not impact performance neither improves it as 
> I'm already on max of theoretical bandwidth.

I think that'd be a good clarification in the commit message.
Like perhaps stating that the throughput is XYZ in both cases
(MTU is also worth clarifying).

> I do expect it to reduce CPU usage and memory footprint because we no 
> longer have to memcpy the entire buffer to SKB and instead we just copy 
> the header and then append payload as page which is passed directly to 
> net layer.
> 
> This feature is already used in some drivers and is part of GRO 
> offloading I think.
> 
> Jakub, as David is off can you please comment on how can we proceed with 
> this series ? I can add more information in commit log for this patch 
> ...

I had some suggestions/questions on the earlier patch, I think a respin
once those are resolved would be good.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
