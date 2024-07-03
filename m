Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 188709258B3
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 12:33:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC3F7C71280;
	Wed,  3 Jul 2024 10:33:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3FA5C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 10:33:13 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so58192611fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720002793; x=1720607593;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TrB2TnPNBgt+WbBBIM4+5QWbIuhtFAqbg6qcHUZxaco=;
 b=nrulRq58Dv0w/WS4d/XnZy5PM3jwUuZkgdLMJgpS89rOTcddj0fYIN85MAO0xCAlKq
 WEqSzDU5EvBR/OhR7FvEFrlZKbdHAtokasZIUX0GrLoD8b2hMBWZ0t+kcN8ePRrITtlI
 BboTJ2UsPDd02Y+2UXA5vACIItIJlnbiSpo+ADJXBi7Zy9rpc2zifBxyYqFIm2LAwRl3
 6ZDDjk7Ke77i/tfSEs+sSRYQ/N9laU2KwwfvfxP91M3amHaYIOFjvXBDKnFieiKMOvc/
 wnJTsjms5K4zw3IzqQuUGurfHq8wn3trzIi5oJL4rXcKYtKFpMITrvceePU+jP91y+ot
 l2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720002793; x=1720607593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrB2TnPNBgt+WbBBIM4+5QWbIuhtFAqbg6qcHUZxaco=;
 b=OwoblFzbuI/DLh/yHNBQ9BWGOW8QNvOtn2rPUWgcy7yHQI+KJa2qScYKFXGLOsO4hd
 4lAcNxkjgaMTBzzKl1yRET4YHyKPqmcvt1u8IGQ6uGEDdSjvARFK8HJinf7oFhyxAJjD
 I6GZZMBlPBL26kE6xIOSMf1Mio9qcbmHOQTWGVr6EOFaWUPeOlnwXTM/cix7EpuLtTPG
 7yB2kkDzqB6nNmppDoUa4pAP+YKz0zuO8sfOIwCi/DGw2KfuzEpt25oLGbmc/iuoZgus
 sJz3jY/HkL5eMHWCcdgBzahtYoAS4Tah9Kd7bah8XxLFEJ0UE/aqpVzC3Elq7YNfz2Vb
 1ixw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa1QQ5UYjilb2gzq6lcvGGDwwxxvgOytj3VURoW79t20y+DfLOeV0hGytadmNpfhXYtNMeOY55pRc40xbam5sOx+JvCrjarblVe2pfZq+rxvoCAJxalc24
X-Gm-Message-State: AOJu0Yyo1k1tpRpX6fjbBVs8QFK+jDNKws4BwrJUlYojUBHQvoSN/Y2W
 vThJDBJOo9ZvwicMV4YB0SaW9318mjGNe6DVCvC7QXPAZHvq6t5J0KmH7Aag92o=
X-Google-Smtp-Source: AGHT+IEgLYgf/SDysaV48RHAuwJ+VgK2M5e2XinMD5byEgw07GiQwTlTQD6QPmY0VgdHWS5AezImMg==
X-Received: by 2002:a05:651c:49b:b0:2eb:d9a3:2071 with SMTP id
 38308e7fff4ca-2ee5e6c9cd8mr61398201fa.50.1720002792033; 
 Wed, 03 Jul 2024 03:33:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee51696991sm18684511fa.136.2024.07.03.03.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:33:11 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:33:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Message-ID: <43nktnqp6mthafojiph7ouzfchmudtht634gtxwg7gmutb5l7y@a5j27mpl7d23>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035735.2182165-1-quic_tengfan@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703035735.2182165-1-quic_tengfan@quicinc.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 quic_cang@quicinc.com, alim.akhtar@samsung.com, quic_rjendra@quicinc.com,
 linux-clk@vger.kernel.org, kishon@kernel.org, kernel@quicinc.com,
 bvanassche@acm.org, bartosz.golaszewski@linaro.org, jassisinghbrar@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, lpieralisi@kernel.org,
 linux@roeck-us.net, linux-pm@vger.kernel.org, avri.altman@wdc.com,
 robimarko@gmail.com, tglx@linutronix.de, quic_kbajaj@quicinc.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, djakov@kernel.org,
 lukasz.luba@arm.com, kw@linux.com, thara.gopinath@gmail.com,
 quic_msarkar@quicinc.com, edumazet@google.com, srinivas.kandagatla@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_kaushalk@quicinc.com,
 quic_bjorande@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, iommu@lists.linux.dev,
 ahalaney@redhat.com, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com,
 linux-gpio@vger.kernel.org, quic_rohiagar@quicinc.com, bhelgaas@google.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, quic_tsoni@quicinc.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, ulf.hansson@linaro.org,
 quic_gurus@quicinc.com, linux-pci@vger.kernel.org, mturquette@baylibre.com,
 amitk@kernel.org, linux-phy@lists.infradead.org, will@kernel.org,
 robh@kernel.org, quic_tingweiz@quicinc.com, luca@z3ntu.xyz, danila@jiaxyga.com,
 pabeni@redhat.com, bhupesh.sharma@linaro.org, athierry@redhat.com,
 quic_devipriy@quicinc.com, conor@kernel.org, konrad.dybcio@linaro.org,
 abel.vesa@linaro.org, davem@davemloft.net, mantas@8devices.com,
 otto.pflueger@abscue.de, linux-riscv@lists.infradead.org,
 quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, joro@8bytes.org,
 vkoul@kernel.org, quic_sibis@quicinc.com, agross@kernel.org, kuba@kernel.org,
 rui.zhang@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 wim@linux-watchdog.org, quic_shashim@quicinc.com, netdev@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 robin.murphy@arm.com, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 00/47] arm64: qcom: dts: add QCS9100
	support
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

On Wed, Jul 03, 2024 at 11:56:48AM GMT, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.

Your patch series includes a second copy of your patches, wich have
different Message-IDs:

20240703035735.2182165-1-quic_tengfan@quicinc.com vs
20240703025850.2172008-1-quic_tengfan@quicinc.com

Please consider switching to the b4 tool or just
checking what is being sent.

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
