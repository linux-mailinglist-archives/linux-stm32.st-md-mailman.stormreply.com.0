Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B884D14B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 19:39:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92367C6B476;
	Wed,  7 Feb 2024 18:39:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C77DDC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 18:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707331178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zA3U/3AyORshqdfEbbnoh4Y8vo2HvRG4is/2gsO8esc=;
 b=CZeFjXS2Gy3my7MoGZarzcxE0MUEbbO1x9EhE4PDlFWTZOdonBq7GOMiUHcvko/sX+ma3Q
 kiQvTVonCO/Wf6+qanxdSFfMeV28/cJHbHCUtmYhlK57BAJYeZJ5Kx5ftVdi0br9jmjqyO
 6C+pQdE9tcakqfYpmWA6I2M13codPMI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-s1z85a6JOqG22vaIv6A8Bw-1; Wed, 07 Feb 2024 13:39:37 -0500
X-MC-Unique: s1z85a6JOqG22vaIv6A8Bw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-68cbfe09cb6so8395856d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 10:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707331177; x=1707935977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zA3U/3AyORshqdfEbbnoh4Y8vo2HvRG4is/2gsO8esc=;
 b=QwroLC9drNHGAh/GacKPP3eaooo8jLeH4ZnOrqYk4EDU24Cl8w5ZoQj80osb/BVlp7
 ZAkEQ5wbmVuHR51Rd1BhO93nLEor84AdbD+fNDdcj/WHFPs+QI14VUJQbkKr0JqJiJ9d
 MiJJQSJlyUFmMCzSuOswhxxmrYvZ8c3qz7FPSpP/D7zIEqTJGlsoC/tTXVVqIjawxAsR
 MBujgLDYEXPOcy8mg8dRO4PuNSy3ESSoRrxj/JWFG8eHRDMGGx2eSckv13duYlA9U2q6
 VvSO3q3zAbEL2S9RwmQbhr3JCRAU41HhFfdC/dylgV7ZgTKCeqnk3e+LVpCvzrIYQDoX
 F4Ig==
X-Gm-Message-State: AOJu0YxeBRXJG8DufnRE6kSDmVUXjTXuSBdp1AiHy1wBIq234NNQyg07
 wTfDetl2bOTO4YtTFxlbSAEJjvxqiDbaQr06cM9yLgtJIH2AQOJRx57K3Aiyt7oisjmO2M8qs1o
 3709HIPN9fx2oxxLdevYcm81/+Gw6ia9mjUvOQHz2PA2zXLRU8tgbrdApKueQtXbo1v+usbUSo5
 awWA==
X-Received: by 2002:a05:6214:19c8:b0:685:7b4a:2fa7 with SMTP id
 j8-20020a05621419c800b006857b4a2fa7mr8226581qvc.33.1707331177326; 
 Wed, 07 Feb 2024 10:39:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkhV8vq9uOtPlMzQmzArx41ClcZgTX4ovDF+F3bU41POaEMaTi1sWPw91DgAY/TwdnFnfIxw==
X-Received: by 2002:a05:6214:19c8:b0:685:7b4a:2fa7 with SMTP id
 j8-20020a05621419c800b006857b4a2fa7mr8226571qvc.33.1707331177099; 
 Wed, 07 Feb 2024 10:39:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0GzdGWjAG3uEc/8XaNsIzLnP2lCtpnJfXojYzocTRbEsdWQeAVTRu/Wpyv0z1y3wZ8mwi68/D0VcboBFxMyF56ceINGg036foh4bJ7yRyZgw+N+3LNGHF3kmR+iz3QE/mAdedoK0Y4CVOAnovVuT+iyyEuUyev3lstJWhHPOlOv1Y0UIsXOv0EnudX3m8lPVks2ynmvW/AU2NFxsm01WA0N1gNBoPzKc6McfGE/UyauLWe6cmk1WAe+FlalMfeIpLgcb4o7BzNN/a2oU5RPeJgEwDWDYSB5UDq7varlmuJUeFGGaN/xeZQOoN2RSmJO9G0serIBPXRU75yEb+oV7jOUwN40jhL4ZsPjmKcKJMllwbMYmVyXlj21SzslNNU96RqM61ELRs85vyu5tgJ4MoTgKn2lP+OMwSQj+ZFNjhR2xFOTeBUxc0iDcHvQ3Q9W4G4qRLT8jAGZb5YzOWG/FRTwZvqshltzVRcCaFpqD4Sbn7wAcrWzfdGDmdkBw39juF5d1EPBGW2NqjiIyyf0q09W2V47WN41qATWQu1g7LSK80+lPifXF3blNhT+yyh3cQZZPmG/3FvWCR6OBq9UUVc1LEOKW+wVwz7bf2f1/RuatXrztUHYgzKMsGEgQngHXEQpnThPkBU7jxm3mGeIkehamoMwndVaLfpSxWTAXuMW4jahbNFeC4fgkw7ubs87SX8VeacxexZ9OapWXaCkuw0roNJawZ01YiDdXIZ6apuvz8u98AiR7yBu1h3yTJE1qSMUVEdJlia3y1WmIiu2zI5xgDXQ==
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 ld11-20020a056214418b00b0068cbc630dc8sm835619qvb.49.2024.02.07.10.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 10:39:36 -0800 (PST)
Date: Wed, 7 Feb 2024 12:39:34 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <6ihzd33vbgvixbe54jjoaj27tc5thhaq7u6iaufbmpejrtgxol@jit6qyaxjy3y>
References: <20240207001036.1333450-1-quic_abchauha@quicinc.com>
 <578b6a6e-83df-4113-9c1f-cdd7aa65f65e@quicinc.com>
 <20240207101934.6c0ab20b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240207101934.6c0ab20b@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>, Andy Gross <agross@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: dwmac-qcom-ethqos: Enable
 TBS on all queues but 0
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

On Wed, Feb 07, 2024 at 10:19:34AM -0800, Jakub Kicinski wrote:
> On Wed, 7 Feb 2024 09:26:05 -0800 Jeff Johnson wrote:
> > > This is similar to the patch raised by NXP <3b12ec8f618e>
> > > <"net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings">  
> > 
> > note that there is a standard way to refer to a prior patch, in your case:
> > 3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default
> > settings")
> 
> Yes, please fix.
> 
> > (note this format is defined in the context of the Fixes tag at
> > <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>)
> 
> A fixes tag would be great. But we can't point at 3b12ec8f618e, right?
> Can someone explain what the user-visible problem is?
> TBS cannot be used? Device reinit is require to enable it?
> 

I'm not sure you'd consider this a fix, but yes the syntax there should
be using that fixes style for sure.

This enables the ability to use TBS / etf on queues other than 0. So I'd
consider this a new feature for the Qualcomm variant of things here
personally.

Longer term it would be nice to be able to change which queues can do
what via ethtool as was discussed over here, but for now this at least
improves things and follows suit with the imx and intel variants:

    https://lore.kernel.org/netdev/c2497eef-1041-4cd0-8220-42622c8902f4@quicinc.com/


Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
