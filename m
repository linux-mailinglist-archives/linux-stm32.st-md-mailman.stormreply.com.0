Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 653ED92645F
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 17:09:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 272BBC71282;
	Wed,  3 Jul 2024 15:09:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C11DC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720019387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwJT/oF0rqnt+S31sg05vpTbadEupYIHlD2ocZCHgDI=;
 b=G2bL6tD9MH3jW9g1eYfLj+TmhYW774/+7RBogi/iGXJGeNf04YRIn16S1nZF53UOJ4ah/Z
 /07VuJdaORsDwljSJnciaZed3PspqvVIm3GmOt8IJZBylXXOGtFGiMxrDhqFt/toAQXORp
 ygiDRj2h3eSH2Hd5vRj77B8klEzhTvo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-weg69WvWMpOdQ03PnP2RWQ-1; Wed, 03 Jul 2024 11:09:46 -0400
X-MC-Unique: weg69WvWMpOdQ03PnP2RWQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-44668469cefso45819501cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 08:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720019382; x=1720624182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwJT/oF0rqnt+S31sg05vpTbadEupYIHlD2ocZCHgDI=;
 b=tfxfcO6T7vm3xOdLSKIYRHN8uwLac8sqs5KfzdvZk7+Lf6j/dmTW41gUW5xfPlszYD
 zv70LKB6nVl/ASkE1FJwa7tSTuMmHw7jTii6u/o6TnldzTHDbi3Yo9kX3iloJ3qJia3D
 fkA0azcRJAlLgdJ1/uF6gZFW8jEpBbjFnlsH+xxx+P3v5vlr2ZLBWOUy64csbxc0VCre
 AjOxW9TFYzGGwNbXXpFvMNgMnOmqrg1VZdoKy6ZjpfgOvqYRwwtmFs3ghuBk8aG3gnw7
 dXbii02gd23Pa406E3Pdd6nf6PKGkDrfd4gbS1nY+arOhvH1HWPBPuLOjqQiQV3Vtdkp
 0OaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZnFomR5Xmsy4gqfkVzSrRqcUPCl/RiRcaPkL/0KtUi6b8TMchkWnESxRz8iYp11ndV8uRJ+yJe9wjEqF0yfSlJE9bG92GalAgA4euMafGbm5HrDCzN2So
X-Gm-Message-State: AOJu0YyeATwdndGYfjaugp8fNSxqyXXPd/WK4C3vmOQJgMNxSO1c69lX
 QNYgOnhfXkV/HoJcJlzkLRMIG92EdZ3+eoVOmaPm+riB5VpSh0c0u9GntyXH8ViypDxOWzE6cKP
 IjMAO04HyxTEZ6FX5qHhpXTxvNYfsZU9/7gbEVyr0fq9ebSK1R9iUNon9+ESaP5j+PX8xFQL80q
 NqqQ==
X-Received: by 2002:ac8:7d84:0:b0:444:b495:e94d with SMTP id
 d75a77b69052e-44662c99f4bmr119752511cf.3.1720019381949; 
 Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8jWmpy5/3+Y1qV1pkAlEofbtK+RF6spB2E3wXQKII8gdILaaxSAxoLFic14g5Q4iTwcc7CA==
X-Received: by 2002:ac8:7d84:0:b0:444:b495:e94d with SMTP id
 d75a77b69052e-44662c99f4bmr119751991cf.3.1720019381501; 
 Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4465c4bf7ecsm43222571cf.80.2024.07.03.08.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:09:36 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Message-ID: <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240703025850.2172008-30-quic_tengfan@quicinc.com>
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
 quic_nitirawa@quicinc.com, linux-gpio@vger.kernel.org,
 quic_rohiagar@quicinc.com, bhelgaas@google.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 sboyd@kernel.org, quic_tsoni@quicinc.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, ulf.hansson@linaro.org, quic_gurus@quicinc.com,
 linux-pci@vger.kernel.org, mturquette@baylibre.com, amitk@kernel.org,
 linux-phy@lists.infradead.org, will@kernel.org, robh@kernel.org,
 quic_tingweiz@quicinc.com, luca@z3ntu.xyz, danila@jiaxyga.com,
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
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, quic_aiquny@quicinc.com
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

On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
> Add the compatible for the MAC controller on qcs9100 platforms. This MAC
> works with a single interrupt so add minItems to the interrupts property.
> The fourth clock's name is different here so change it. Enable relevant
> PHY properties. Add the relevant compatibles to the binding document for
> snps,dwmac as well.

This description doesn't match what was done in this patch, its what
Bart did when he made changes to add the sa8775 changes. Please consider
using a blurb indicating that this is the same SoC as sa8775p, just with
different firmware strategies or something along those lines?

> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 6672327358bc..8ab11e00668c 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,qcs404-ethqos
> +      - qcom,qcs9100-ethqos
>        - qcom,sa8775p-ethqos
>        - qcom,sc8280xp-ethqos
>        - qcom,sm8150-ethqos
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3bab4e1f3fbf..269c21779396 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -67,6 +67,7 @@ properties:
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
>          - qcom,qcs404-ethqos
> +        - qcom,qcs9100-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
>          - qcom,sm8150-ethqos
> @@ -582,6 +583,7 @@ allOf:
>                - ingenic,x1600-mac
>                - ingenic,x1830-mac
>                - ingenic,x2000-mac
> +              - qcom,qcs9100-ethqos
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> @@ -639,6 +641,7 @@ allOf:
>                - ingenic,x1830-mac
>                - ingenic,x2000-mac
>                - qcom,qcs404-ethqos
> +              - qcom,qcs9100-ethqos
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - qcom,sm8150-ethqos
> -- 
> 2.25.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
