Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8294FCDFF1B
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Dec 2025 17:24:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B17AC60497;
	Sat, 27 Dec 2025 16:24:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45176C030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766852678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=;
 b=YfWK07ZZ3bqY4jAUY4IdVwC/dftD/H0oQM9okyCrKIDqfjvhnc3e4te4zcM5RCkbk4uTCD
 ADNa3iszQ6CQCB6on6V4ccgFF+3drdA73pJaZEe3jT4+21MxodsUWWM2CQC0SCwp1Nzi+q
 qSozPUglKjQbfTMnAAYBWN6PxvWnL+0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-2_RmXYBrN_OVEBa_Jnxd1g-1; Sat, 27 Dec 2025 11:24:36 -0500
X-MC-Unique: 2_RmXYBrN_OVEBa_Jnxd1g-1
X-Mimecast-MFC-AGG-ID: 2_RmXYBrN_OVEBa_Jnxd1g_1766852675
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779d8fd4ecso40429045e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Dec 2025 08:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766852675; x=1767457475;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0pFoW0fxxbGtsoDZJaaxbA0XpDtBn2L+88OYPdKiVs=;
 b=Tv5vriaqW55OyMGJoNQGqPbn1j3IsOCdKl71kJiODSnaTZXQbFVIpcSpzzz10Ozjcm
 rFh51WSUrj1EkovhTZ4EcnqJIYS3wRqcSYmtwAVWQfp8Btgij8Aatdb439zlT7El0DER
 /kEJsJ1VQDDSFbVrZ971QFqbWwcpWeN8jKy2UrIeOG5KXXZ3cN23CIT3p2kWSriMH67B
 gVY3IkkhomBpSmNGVBR+7LgUybRckfY6iiGxB3nZrzY29nnSZKCqhe1H62R168ed452u
 91WiN02YLSdULmmWZkl/+2JIYqyj1Jmqu2bPAravHTg4xyHuXFYyBmhu3zR1PLmFa8p4
 Vd9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyGN+RG+vOAL1ho/ETVlZMOEYXXSNoKQ8MvkrKTyTBm5oEdqicYsZJ2mu5LjNuBA7pQ/bJOjZgySSgBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNR6KDX/c+84DV3kEb7O90MyqEquneyf1Q0LP4QxmxSSMZYBi4
 F9B7jpNS5v+l3cHBsBHW3oyhLhNTnu0+89jHtNlGSk9OrczUoxBtJPSakEgOfbUyJyONEgbT1Qb
 k3AQC7oGaKioSLA0KXH9tOlFdDF1JM4XJQIy1vbkwZ8PllzIkY2jU3jItogBiPiZeE9CGqbVFAo
 3mIAvqMA==
X-Gm-Gg: AY/fxX4Sb2gm881FACiDTXnrG865Z6ZJI68c92sZxbp8U0J3KcVYSYYI4Zd0J9BucdV
 8Sk2lZkGVZsmuBLwGRag4vaioup9MKRgWP8iiRbbh3oUnlmvGUTWQspM1feWq2IamOKjzW2VhBF
 98h7wVNxBWhd7/IQSTFn0X5o9cBWUnOn/dwVYq6/A4Mb2Tt5jAf+/VeAOn3cIrKjlCjG7/6EMDu
 gvDJzCKEpYPcLusfqJtbqhLsSVdpdSJSEFwe1TZqIXsPPJDMfnFb1aGi+RYItPW7IJxaB3mgnI5
 mC5KwDgV08x+qw3cAUDVNyr6Ltzy0agoAyLG/8stZrRBe2au02bmtyjFyxTFvpcSf8KzCQFxIrM
 EWEoeYoeEyamQzQ==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id
 5b1f17b1804b1-47d18be144fmr257527095e9.14.1766852675255; 
 Sat, 27 Dec 2025 08:24:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+n6rR4mCRXdumkBNyVc/341HA3AYN1kUq6F6siD1Lcd+ziTKXrb+aL7jp1MXCilbI6b58Tg==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id
 5b1f17b1804b1-47d18be144fmr257526865e9.14.1766852674879; 
 Sat, 27 Dec 2025 08:24:34 -0800 (PST)
Received: from [192.168.88.32] ([169.155.232.231])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be396c909sm194725735e9.0.2025.12.27.08.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Dec 2025 08:24:34 -0800 (PST)
Message-ID: <80be718c-3592-43bf-b3ab-8e1b9d3cf41a@redhat.com>
Date: Sat, 27 Dec 2025 17:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com
References: <20251223101240.10634-1-eichest@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251223101240.10634-1-eichest@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n65eTIG8l0P2xltPWM1YjyrofmAcW9fIKvJV9ajKWHE_1766852675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: robh@kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac: Add a
 fixup for the Micrel KSZ9131 PHY
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

On 12/23/25 11:10 AM, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a fixup to the stmmac driver to keep the preamble before the SFD
> (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> used on an NXP i.MX8MP SoC.
> 
> This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> states:
> ENET_QOS: MAC incorrectly discards the received packets when Preamble
> Byte does not precede SFD or SMD.
> 
> The bit which disables this feature is not documented in the datasheet
> from Micrel, but has been found by NXP and Micrel following this
> discussion:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> 10MBit. Without bit 2 being set in the remote loopback register, no
> packets are received. With the bit set, reception works fine.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
