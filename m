Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF5AAFA3A
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 14:40:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35839C7A822;
	Thu,  8 May 2025 12:40:54 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A087FC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 12:40:52 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5fc9106466fso47451a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 May 2025 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746708052; x=1747312852;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FfaMOjFCxtcOF8MhEpb1KgHLIQZnLvXhrX8KE+Reg/I=;
 b=JrJwr//1Yu7RQCtaiyQYjPUcVtUVeRmeuY590STWCsOkvryHWpzMfJiH8r1LkVZtIT
 7R9eBZnAEytUbY6adSfJUqT46OJ6T6r4rQxgJ9+Zky8/EsLU8T85SX44mVpC1l8hT6yt
 KzcjogTLSBJ3F1kAazBaL4gbMDsAAKDbkREuR6tDfTgKyW48twx8nAYhZ7hLLzxudreW
 IZUMHCerCbdw51ZvHlAcp3sbTqj7OlTQ7wgrm8czv1o3rZmojucQtlrh2n4VGzyEFT6i
 /XkZOZQksPmayWqlQfDD4WtF2Ag9D4Gnycbv9lTVKK+Yv8hCLqp78YYHObBhMUVNbpYU
 yyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746708052; x=1747312852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FfaMOjFCxtcOF8MhEpb1KgHLIQZnLvXhrX8KE+Reg/I=;
 b=Aj0Yo+KAq2eOn1ulz3G9ES2eMM/dioI15DHu1PP3mQKQF5VJ0/jMAQpPwlKLWZOHAf
 T3/LI2WgFpBVJqc1AjtyPVRZeAIGCWCEaeJ2oPox7QatdVBFvV0FJa5a9p06KEHefNOf
 2f9Nt2/UoZKkY1EhCy1yK4stgcFmjNP3WgwHeaYkMpktHParS2vFgMD8XWfQ/MvaSSaj
 ye1tzLJhv3mfnEiWheHyoiYZaeD3KnSLLnopZak3kIS6wuCuAlBtyXylec9xycGf0RtR
 IZ2S1/29F/KZG4ULerYV7T0WlCvIX0ZY7kLlc3fOk7UOmDrcUZVMecS6GpqUHaAm4hhe
 5nCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdd0R32xd5HhjTzk8yWssJu/ZOFNTm7kMJjw2IBFxzpjeid3+mgR3EUVgpzIHu4gM+enyg8WU/I1+eCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyamt0uBU6pErA7cSE3D7oDUTXyr3TOFEO12RVis/7pNcGS2/2x
 e03gS+RmvLGE6Jw4wZZ+MzpRVIT734i1znyp0ttaytsOJCzqdwpX
X-Gm-Gg: ASbGncuUzom7Ss/6je1PwdvIe4MtAoSWOJQWqxoCsjJ0OSRllRA3+utXbRrj1RLd+JQ
 oVI9cbRY85Nb85+zC4UoC7VjZPxUH6g3o/cax1I/Q8MyjR6uKw2iPrG8U/jqNfDRz1NOyfsBV/u
 OLtahPhhSli8/+5Yzur312d0jdY1R3XV+2B64rX7OCzoGFEMg8pytCwwuS8i+b3lcMtxKFlCm2n
 dOF3HizsEncrmjXPY330hixIRmGKOnZ4muP+OqlJ8RS9GEwsnAC7Wqd+bm8/ndN72yoEbe/wtsU
 CoZXJcGMDLnLRERqiasWjJGBM/J7
X-Google-Smtp-Source: AGHT+IFmPs/2aiiB0+rhM6F30MuvsarGsibw9G89lQ2xc3LVHmTRux9M5oIqfkwsO5WMCG0k9AZPCw==
X-Received: by 2002:a05:6402:278d:b0:5f9:2a29:543b with SMTP id
 4fb4d7f45d1cf-5fbe9e329e6mr2233823a12.5.1746708051532; 
 Thu, 08 May 2025 05:40:51 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b70sm11517512a12.29.2025.05.08.05.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 05:40:50 -0700 (PDT)
Date: Thu, 8 May 2025 15:40:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Message-ID: <20250508124047.xyhrabkxsbhceujv@skbuf>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
 <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com>
Cc: willemb@google.com, horms@kernel.org, irusskikh@marvell.com,
 davem@davemloft.net, netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, pabeni@redhat.com,
 Horatiu Vultur <horatiu.vultur@microchip.com>, sgoutham@marvell.com,
 Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

On Thu, May 08, 2025 at 08:22:39PM +0800, Jason Xing wrote:
> Thanks for the kind reply.
> 
> It looks like how to detect depends on how the bpf prog is written?
> Mostly depends on how the writer handles this data part. Even though
> we don't guarantee on how to ask users/admins to write/adjust their
> bpf codes, it's not that convenient for them if this patch is applied,
> to be frank. I'm not pushing you to accept this patch, just curious on
> "how and why". Now I can guess why you're opposed to it....

The BPF program is not user-generated, it is run in the context of the
function you're moving.

skb_tx_timestamp()
-> skb_clone_tx_timestamp()
   -> classify()
      -> ptp_classify_raw()
         -> bpf_prog_run(ptp_insns, skb)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
