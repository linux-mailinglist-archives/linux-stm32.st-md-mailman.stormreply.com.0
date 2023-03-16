Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9297A6BD4E3
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 17:15:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40885C65043;
	Thu, 16 Mar 2023 16:15:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04034C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678983331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mlukPFgMuUiNDYUja4zCoHJNdHul/iInVFC/mNyQV8Q=;
 b=WeIDxR7eS8wn2u9RAe3uYDIPjTN3fa4/3TeEbrgNYTSA4OJ8lRDo/CcY0j4qAa3S/r8Fqy
 gBe/su+wJTNYG82KbEpOSbu1QSG6q6LdQAXuO10fQiRi8H76X/6IMfuPWcTWQZ0gwTSPb/
 c2KGZl4aWeseV6gwMI8XUeq9odNrW3E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-0NiD1TbZMPC8yF6-ZjV2vw-1; Thu, 16 Mar 2023 12:15:29 -0400
X-MC-Unique: 0NiD1TbZMPC8yF6-ZjV2vw-1
Received: by mail-qv1-f71.google.com with SMTP id
 g14-20020ad457ae000000b005aab630eb8eso1329466qvx.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 09:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlukPFgMuUiNDYUja4zCoHJNdHul/iInVFC/mNyQV8Q=;
 b=SWbqhmfp3FSDMPrekDU10CJinf6ksyvethT/fRAScHS9xvAC3XC37+aI7aSX3TcTje
 3UnWPDaqJ+Qso+a2lk6TpMzcuZnUg12urPIoxZksnUQGeQVcjp1MRLOA6kmLwz8nWR0l
 TGMcchKUXWP4bKCQywo9QzMxwilIQRpVmczIbLmx04MWlBFMZ3UVLKSgowDVX1kOT5A2
 HSnW0TdSnt/3if0T+PbVkk/9hKb6mSNQ8582TT8JDzJAGhG+u6Bv9u5DckCwv//vw1Q8
 BWgyD/nkn58rb3Oi1n5ep45jxtwKrCEppXEM9GibzlA8BSAWVeJoKpjQ6XfeLtBfxSly
 G91Q==
X-Gm-Message-State: AO0yUKWV/Mqc6mGy7PrxcW0WYwFg56chGYxK6s5UNR9j6d1xvnnNj6hH
 YVJ4FuTjTaL+cRU3WLWn9pm1PcMVprirE53lWiVJ9h3sDP32nYffBTviXv3RWOa9BoByEGE17IR
 XITHQUF6CrunM94A8pJZj6KPKVeiSUwRFA+6s7Bu/
X-Received: by 2002:a05:6214:2428:b0:574:8ef8:89d2 with SMTP id
 gy8-20020a056214242800b005748ef889d2mr39824757qvb.38.1678983329412; 
 Thu, 16 Mar 2023 09:15:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set+of7na8F1dFKLndAwQGwakPmWiDEiDVwrlTO9yupX5AyjFyMqZe903mbwQxlEn+ZQoYaB20w==
X-Received: by 2002:a05:6214:2428:b0:574:8ef8:89d2 with SMTP id
 gy8-20020a056214242800b005748ef889d2mr39824676qvb.38.1678983329027; 
 Thu, 16 Mar 2023 09:15:29 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 q16-20020a05620a025000b00745df9edd7csm4841721qkn.91.2023.03.16.09.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:15:28 -0700 (PDT)
Date: Thu, 16 Mar 2023 11:15:25 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230316161525.fwzfyj3fhekfwafd@halaney-x13s>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-2-ahalaney@redhat.com>
 <d4831176-c6f1-5a9b-3086-23d82f1f05a6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d4831176-c6f1-5a9b-3086-23d82f1f05a6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Topics: 
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 netdev@vger.kernel.org, andersson@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] dt-bindings: net: snps,
 dwmac: Update interrupt-names
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

On Thu, Mar 16, 2023 at 08:13:24AM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 17:56, Andrew Halaney wrote:
> > From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >
> > As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
> > interrupt error msg") noted, not every stmmac based platform
> > makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
> >
> > So, update the 'interrupt-names' inside 'snps,dwmac' YAML
> > bindings to reflect the same.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> >
> > I picked this up from:
> >		https://lore.kernel.org/netdev/20220929060405.2445745-2-bhupesh.sharma@linaro.org/
> > No changes other than collecting the Acked-by.
> >
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 16b7d2904696..52ce14a4bea7 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -105,8 +105,8 @@ properties:
> >      minItems: 1
> >      items:
> >        - const: macirq
> > -      - const: eth_wake_irq
> > -      - const: eth_lpi
> > +      - enum: [eth_wake_irq, eth_lpi]
> > +      - enum: [eth_wake_irq, eth_lpi]
>
> I acked it before but this is not correct. This should be:
> +      - enum: [eth_wake_irq, eth_lpi]
> +      - enum: eth_lpi

Would
+      - enum: [eth_wake_irq, eth_lpi]
+      - const: eth_lpi
be more appropriate? With the suggested change above I get the following
error, but with the above things seem to work as I expect:

    (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac|rebase-i] % git diff HEAD~
    diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
    index 16b7d2904696..ca199a17f83d 100644
    --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
    +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
    @@ -105,8 +105,8 @@ properties:
         minItems: 1
         items:
           - const: macirq
    -      - const: eth_wake_irq
    -      - const: eth_lpi
    +      - enum: [eth_wake_irq, eth_lpi]
    +      - enum: eth_lpi

       clocks:
         minItems: 1
    (dtschema) ahalaney@halaney-x13s ~/git/redhat/stmmac (git)-[stmmac|rebase-i] % make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/snps,dwmac.yaml
      DTEX    Documentation/devicetree/bindings/net/snps,dwmac.example.dts
      LINT    Documentation/devicetree/bindings
      CHKDT   Documentation/devicetree/bindings/processed-schema.json
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:interrupt-names:items: 'anyOf' conditional failed, one must be fixed:
        [{'const': 'macirq'}, {'enum': ['eth_wake_irq', 'eth_lpi']}, {'enum': 'eth_lpi'}] is not of type 'object', 'boolean'
        'eth_lpi' is not of type 'array'
        from schema $id: http://json-schema.org/draft-07/schema#
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:interrupt-names:items: 'oneOf' conditional failed, one must be fixed:
        [{'const': 'macirq'}, {'enum': ['eth_wake_irq', 'eth_lpi']}, {'enum': 'eth_lpi'}] is not of type 'object'
        'eth_lpi' is not of type 'array'
        from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: properties:interrupt-names:items: 'oneOf' conditional failed, one must be fixed:
        [{'const': 'macirq'}, {'enum': ['eth_wake_irq', 'eth_lpi']}, {'enum': 'eth_lpi'}] is not of type 'object'
        'eth_lpi' is not of type 'array'
        from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
    /home/ahalaney/git/redhat/stmmac/Documentation/devicetree/bindings/net/snps,dwmac.yaml: ignoring, error in schema: properties: interrupt-names: items
      DTC_CHK Documentation/devicetree/bindings/net/snps,dwmac.example.dtb

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
