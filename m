Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16E9289EC
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 15:42:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 862DCC71282;
	Fri,  5 Jul 2024 13:42:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7ABEC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720186946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNWQiXa5WTonO6VnFXHoZW4uvs/niJejriJYafDuJeE=;
 b=cxj4bz5JmsotFFslY1NW/t9fdOC8FwQQHhvmncDBCllpsDVlTncZF881ABMAOxcBmB/uZP
 Ik/geTb1L0w2eM+PjmSsSiRRORa7qDScEQgyD7eBQmrjTLGKuHIHD/8mehD5C73ekhu8ga
 jRZQusc0/fAEky/WeZ8mKr5e3ZmYkww=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81--b8nRFX5PGKzd2WoxHBCqg-1; Fri, 05 Jul 2024 09:42:25 -0400
X-MC-Unique: -b8nRFX5PGKzd2WoxHBCqg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-79efed0e796so25757085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 06:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720186945; x=1720791745;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lNWQiXa5WTonO6VnFXHoZW4uvs/niJejriJYafDuJeE=;
 b=bWxdKx29rQlpaK/EQ2/XXwUoRCLfUBg37lePLMIkCCxVvmLsOd5+rIsgb+sZ1pr7Wc
 M5/Em8qFN1wxt9BXyCCFOqPVGviEnCnJi2wse345HxTiO0ixJY/KyVhLOGmZhsVMmktq
 GTUAKbxrjS33Q5OAWevILuotLyVKjd+dVP2qBNEEsl0zzNNnKkOdMN+816vFRAkCOHP+
 MUVlFW+Zxm0D3vsCT4jrJ/+GSFEV/sq1hD9+77qlTdYbYbQCJlXPh9p2Dc2qsNtL7G2D
 IucbkqIMRnB/k/s8tooWCkDwPWLx4rvcyf98QV4jrojPJRD7z/kBqOJ2XwF5OM0ISnBA
 JUKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbGzAEAA7K585NmN0gW03E8nN/yFg/khsowuDJO2RiD4d/5iLTpFtBhyDOzS/JkXK+jD0xHKkWqirEJkMU/pwiMwGWKOEubWe9jT7bbAZvrlAffi/sUqZU
X-Gm-Message-State: AOJu0Yym3aM+bQ/gqnsne4xp+DFTmV+QmK7nUD7S9MJJi4xrLUbgj+ks
 B3vJ4GQFYj1V8r5nJLrnQSKawsoxV2Rt465jKNguuJ5UsVe0X44mbxs5PwEyFQI29btF81bXNdj
 qFuRJoYSD+RzaKAis4z5dsysfyqTCXCHUBDo0FRzDD88KV3BbMwvqDt8q7PsoGy5IsxxcYhAj16
 xOgQ==
X-Received: by 2002:a05:620a:13d2:b0:79d:7e5a:d044 with SMTP id
 af79cd13be357-79eef4c0f06mr737800085a.28.1720186944987; 
 Fri, 05 Jul 2024 06:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzRoLCo4GeRRFCdesL0t0J6Xc2rhP3ZGCRDtPGGaxotQxYNzT1wzmgDzK5ccFskQ+43Nbdxg==
X-Received: by 2002:a05:620a:13d2:b0:79d:7e5a:d044 with SMTP id
 af79cd13be357-79eef4c0f06mr737789985a.28.1720186944583; 
 Fri, 05 Jul 2024 06:42:24 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69299b81sm773174785a.71.2024.07.05.06.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 06:42:24 -0700 (PDT)
Date: Fri, 5 Jul 2024 08:42:19 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <gt35pxlulfowpbca3sb6nf5ble4lhq3kolmjyc275vtdcmeixx@gkctewz6tbwv>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
 <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
 <f4162b7f-d957-4dd6-90a0-f65c1cbc213a@quicinc.com>
 <add1bdda-2321-4c47-91ef-299f99385bc8@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <add1bdda-2321-4c47-91ef-299f99385bc8@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
 linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_nitirawa@quicinc.com, linux-gpio@vger.kernel.org, bhelgaas@google.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, quic_tsoni@quicinc.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, ulf.hansson@linaro.org,
 linux-pci@vger.kernel.org, mturquette@baylibre.com, amitk@kernel.org,
 linux-phy@lists.infradead.org, will@kernel.org, robh@kernel.org,
 quic_tingweiz@quicinc.com, mantas@8devices.com, luca@z3ntu.xyz,
 danila@jiaxyga.com, pabeni@redhat.com, bhupesh.sharma@linaro.org,
 athierry@redhat.com, quic_devipriy@quicinc.com, conor@kernel.org,
 konrad.dybcio@linaro.org, abel.vesa@linaro.org, davem@davemloft.net,
 Tengfei Fan <quic_tengfan@quicinc.com>, otto.pflueger@abscue.de,
 quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org,
 quic_aiquny@quicinc.com, vkoul@kernel.org, quic_sibis@quicinc.com,
 agross@kernel.org, kuba@kernel.org, rui.zhang@intel.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org,
 quic_shashim@quicinc.com, netdev@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, joro@8bytes.org
Subject: Re: [Linux-stm32] [PATCH 29/47] dt-bindings: net: qcom,
 ethqos: add description for qcs9100
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

On Thu, Jul 04, 2024 at 06:03:14PM GMT, Andrew Lunn wrote:
> On Thu, Jul 04, 2024 at 09:13:59AM +0800, Tengfei Fan wrote:
> > 
> > 
> > On 7/3/2024 11:09 PM, Andrew Halaney wrote:
> > > On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
> > > > Add the compatible for the MAC controller on qcs9100 platforms. This MAC
> > > > works with a single interrupt so add minItems to the interrupts property.
> > > > The fourth clock's name is different here so change it. Enable relevant
> > > > PHY properties. Add the relevant compatibles to the binding document for
> > > > snps,dwmac as well.
> > > 
> > > This description doesn't match what was done in this patch, its what
> > > Bart did when he made changes to add the sa8775 changes. Please consider
> > > using a blurb indicating that this is the same SoC as sa8775p, just with
> > > different firmware strategies or something along those lines?
> > 
> > I will update this commit message as you suggested.
> 
> Hi Andrew, Tengfei
> 
> Please trim emails when replying to just the needed context.
> 

Sorry, I'm always a little guilty of this. In this case I didn't trim
since the patch was small and trimming the diff out would then make it
tough to see how my comment about the description relates to the body of
the patch. But I'll try and trim when appropriate. Just replying here to
explain myself as this isn't the first time I've been suggested to trim
more aggressively and I don't want folks to think I'm completely ignoring them.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
