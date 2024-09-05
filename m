Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A796DC8C
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 16:52:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CD83C78013;
	Thu,  5 Sep 2024 14:52:42 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BD59C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 14:52:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c245580f5cso111425a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547954; x=1726152754;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2g54gJr7dWkd7+x+HAWM4aabzzENjq1zl97emHDcyg0=;
 b=fiMZXXA2TY05GOIlmHaB5A3HY9sa61+BLg5dSPxclMqBrqE78bgHnq2oxpqA3MEcc3
 E1mWv7h4abnRENnadGaQU7cSQAjsaD3J3NzVa7e57HaVw91/n3ALNQD3npa9eJSDcjQ/
 87/TiJLnUP0XueqDmm84k37bGkrFKDVaQozrkEAFCR4Rar26zi964Dxb6EmVVnu1zDMp
 iRwK7PrMeSwWFUSXeGfA21gwcF/gMKoCBYETa2SnD0T7xrmhioJ+5LazAy/tCY5GX30N
 ADgSz0P2y8kvIDQEV/Q4IS7OADz26vDwFiYDaKDoOsLqBVvtroDdYDCYkPXKCN1Z9SBB
 LNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547954; x=1726152754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2g54gJr7dWkd7+x+HAWM4aabzzENjq1zl97emHDcyg0=;
 b=cPuG4NgIx6snwdEINp+j6yaAU8KVDLSq1/R+/TBlmhm3oRSPnli5lvfcgOzgWhT4L4
 cK4k/JKaqYYd3niHFqhadl7E3z2qK/SywYuj6wkMUm1jE6GORF7hC6+rrnxFftu4vZlG
 nTGEGFYHoWrX8b9valnBi60aJ9UPP1YjrSzjA3v3LO9F1RNAbwWznvq1vy+ZFSSYSUxE
 O8aLA3cmDhYfnBZQydTDSscfvNhg3TnpAbdt7+MD4lQDtKSIbltPamGpbEQoYDXtl7oo
 XCaBsgMggEvc3LZXHTFgYTChhRxvip83OOZ8M7OilbcnYo61lVqPBuUh8qxgHVO83r8w
 WA+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUklDSnhYoo+2caRaUpJiDge38do2sJE9rvLfHDlbbOODwYd5rE7Fi9B7b6iQpZhbIszZuLC66bB4TgJQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQRvzfAnzDmnfvZh55MpA3Jvo9pbyriOjIsqYLolNJ15HW0vMk
 hJ8d03uZEZ/7JphorG/nXTmT5ojhihfYDNAG+hKCLPbrAe7w9weF
X-Google-Smtp-Source: AGHT+IEgYP9p1NEcW+b7LA2SeKoblfl5T6ojFMNpFfgzLYg4QChmu3Sjk2pZhSKhLGsFCf2S5rRTOQ==
X-Received: by 2002:a05:6402:1ecb:b0:5c2:67da:9742 with SMTP id
 4fb4d7f45d1cf-5c267da9903mr5148025a12.4.1725547953042; 
 Thu, 05 Sep 2024 07:52:33 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc551234sm1303917a12.36.2024.09.05.07.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:52:32 -0700 (PDT)
Date: Thu, 5 Sep 2024 17:52:28 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240905145228.raglhbpikfxolgrw@skbuf>
References: <cover.1725518135.git.0x1207@gmail.com>
 <cover.1725518135.git.0x1207@gmail.com>
 <55067bfa505933731cbd018d19213b89126321e3.1725518136.git.0x1207@gmail.com>
 <55067bfa505933731cbd018d19213b89126321e3.1725518136.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55067bfa505933731cbd018d19213b89126321e3.1725518136.git.0x1207@gmail.com>
 <55067bfa505933731cbd018d19213b89126321e3.1725518136.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 6/7] net: stmmac: support fp
 parameter of tc-taprio
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

On Thu, Sep 05, 2024 at 03:02:27PM +0800, Furong Xu wrote:
> tc-taprio can select whether traffic classes are express or preemptible.
> 
> 0) tc qdisc add dev eth1 parent root handle 100 taprio \
>         num_tc 4 \
>         map 0 1 2 3 2 2 2 2 2 2 2 2 2 2 2 3 \
>         queues 1@0 1@1 1@2 1@3 \
>         base-time 1000000000 \
>         sched-entry S 03 10000000 \
>         sched-entry S 0e 10000000 \
>         flags 0x2 fp P E E E
> 
> 1) After some traffic tests, MAC merge layer statistics are all good.
> 
> Local device:
> [ {
>         "ifname": "eth1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 0,
>             "MACMergeFragCountRx": 0,
>             "MACMergeFragCountTx": 17837,
>             "MACMergeHoldCount": 18639
>         }
>     } ]
> 
> Remote device:
> [ {
>         "ifname": "end1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 17189,
>             "MACMergeFragCountRx": 17837,
>             "MACMergeFragCountTx": 0,
>             "MACMergeHoldCount": 0
>         }
>     } ]
> 
> Tested on DWMAC CORE 5.10a
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
