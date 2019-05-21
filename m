Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7524B75
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 11:27:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D11EEC725DE
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 09:27:33 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FC9EC725DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 09:27:33 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z5so15172515lji.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Xy6KpBMf4VElfSxI8JZgNkIn+5swVz4A7VXhYDp2D4=;
 b=gi0FnqEmcboPROS3aUYX2FmzKmldrXp2Xd53Cs+z0s80NF/1tJ+89FLSOmuykkWh0a
 Bseps+m7BHSnZFk5NVsRLKcGhVs10u9VBXuk7ZFWImQxcj/UfGSJbg6gJGqG3M6Eryu0
 +6VMdvaQODEdkEjm10eVWCg6HQioXvq/vhckhU8CXA37bZxImLyV9zUqEhECALNCOSWj
 Io7qmy3Kwb5wIloKJURrXpWb2PPdq2gW5p7a9/ShaO6loZBFBAo1n7iTGu7RKvdGnRAu
 5KIh2bLGig4OqmPNCI6RFNpRPS27XWQk6PKwqmubBBllN7izvBcvS8lnUx17EQ9e1BYP
 sbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Xy6KpBMf4VElfSxI8JZgNkIn+5swVz4A7VXhYDp2D4=;
 b=m2AJTfPJgyagbSrx0CaQaXkapGC4Um7q2TK1J7Dmat5Nu0ESmeWXHUhRvSQNss0IHY
 E3aiKldKDjOqmExZV2wi1SG4UzkwfYoG/1Tk56/ou2oM+mRQOjsR9P9Jld/xgiantaCL
 Q5A10pkii8m8koub1+8AOI/nbyBoAJ+EQvOjzayme6lBA0bEw4QDviF1GugboQFx1fmV
 MG9fZ8iC3Jhwmpej04a8tLCmHqkSHxLjFgHbH8sFY1TqK8Wg/zb3JaXUGf8QNpPWPdfb
 rDyi9xTzYAgS6OkclcQwVyTNK0ko2k1tsPh60kwmnshVgeDF0UIgWo7EksT0ho/zoM9p
 5dag==
X-Gm-Message-State: APjAAAXNynCP1Qi6pkAtrFY6HL7lLH7AcxtD6lxi+sOafjZyTaK+dkC7
 NSBGO6hVt5JM5taHXvsmssPWZYK9cDo=
X-Google-Smtp-Source: APXvYqz2W9cUR77wBpFQtxU/OEIMqFs1dqOYZh2m5bXIMOiU7pDh+NaARFsIcqKmxsWQZ0msZguFsQ==
X-Received: by 2002:a2e:60a:: with SMTP id 10mr3542802ljg.126.1558430852654;
 Tue, 21 May 2019 02:27:32 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.81.21])
 by smtp.gmail.com with ESMTPSA id u128sm1039382lja.23.2019.05.21.02.27.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 02:27:31 -0700 (PDT)
To: megous@megous.com, linux-sunxi@googlegroups.com,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-3-megous@megous.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4e031eeb-2819-a97f-73bf-af84b04aa7b2@cogentembedded.com>
Date: Tue, 21 May 2019 12:27:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520235009.16734-3-megous@megous.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [Linux-stm32] [PATCH v5 2/6] net: stmmac: sun8i: force select
 external PHY when no internal one
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello!

On 21.05.2019 2:50, megous@megous.com wrote:

> From: Icenowy Zheng <icenowy@aosc.io>
> 
> The PHY selection bit also exists on SoCs without an internal PHY; if it's
> set to 1 (internal PHY, default value) then the MAC will not make use of
> any PHY such SoCs.
          ^ "on" or "with" missing?

> This problem appears when adapting for H6, which has no real internal PHY
> (the "internal PHY" on H6 is not on-die, but on a co-packaged AC200 chip,
> connected via RMII interface at GPIO bank A).
> 
> Force the PHY selection bit to 0 when the SOC doesn't have an internal PHY,
> to address the problem of a wrong default value.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
[...]

MBR, Sergei
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
