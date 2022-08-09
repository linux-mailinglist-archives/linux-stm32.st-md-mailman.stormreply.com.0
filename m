Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135258D327
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Aug 2022 07:29:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A2D6C04003;
	Tue,  9 Aug 2022 05:29:18 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BFEEC04000
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 05:29:18 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id o2so8229960lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 22:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=u/hZlxsdOPGw/Z2ifZgq67lFc+EwFWOndp1d8qCJ2O8=;
 b=NrPr10ZujPg8N0R6nOI/K7Quje7yvVAdJqW1wgapVrP2H2s6lwauQKiIXAxsKK2t0Z
 yC2HhUydYskBXLH+QWkY3YaqPz98IdV0xfAwn4S9KIcOY4UBT1WWjX40m10j8T66ZkjE
 munSYPDFjcQeRlPSCC8pWfem/9NzH1hufVR22KKTHL/eOEQn6H5FFRqiviGWMGHqGzio
 yamuy90GMkH526Ut/tvyvfiUmgyX+irBDbWQxITknIkHKbh5x2fSISsf8rX3xKHZbBPh
 CKtcZ2OhvZxxQxmYmD0W6lN4GHK+n6+aL/IY5i9458Nrpr8aBTKSoUcr/vAXEHHbQkNZ
 dMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=u/hZlxsdOPGw/Z2ifZgq67lFc+EwFWOndp1d8qCJ2O8=;
 b=aqFe1yPlxKkjRXckyDp9bmzMtFG2iN0ZGDBDA4ZwWBBOIzwFhhxt7j/angPSAEqaBn
 VbCZndp9XUJVnf9oq9RdTL5oeKMA4MbEmZ4gzpjn9I1bPUwX3IV5XipCKCPc1NaowVun
 3TnTC40nNAIr9t3HkWL7JhpINJg3QOp00O8fi8NfTP7Djj/xkyLeB/suN/WTpTPcRCBT
 q+bAAYaued0mqAVj92fFQFSAkhmL/Vp8QvhvdppvbzQx/0PPm1CxU9GMLMUlw87PxRJj
 ZSvn9Mta9bXfrQxbgsf4QawPU8V5RXTPO6F/nVERBUGrwGHavJM12fIzMIYx1OoBRzaX
 dHRQ==
X-Gm-Message-State: ACgBeo3VQzxB7+dZkWPHl52o48WyKm/U/jFllIKTkDP4NweGMK9olS+o
 GioXC7i03m+G/lBLNTvYJw4HHQ==
X-Google-Smtp-Source: AA6agR5kYLA7ov5xiceEa1hxn2Gue+4ehJgPDN3o+sVTwyH9ADjDLIH0KZGgfn2gz8GFF5FQS73zQA==
X-Received: by 2002:a19:654e:0:b0:48b:965d:d182 with SMTP id
 c14-20020a19654e000000b0048b965dd182mr5558154lfj.610.1660022957344; 
 Mon, 08 Aug 2022 22:29:17 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a05651c119b00b0025e01ee7229sm1551622ljo.54.2022.08.08.22.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 22:29:16 -0700 (PDT)
Message-ID: <b15184d6-c9e7-d042-621b-ef4ccd3c87ba@linaro.org>
Date: Tue, 9 Aug 2022 08:29:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220808074051.44736-1-patrice.chotard@foss.st.com>
 <20220808074051.44736-2-patrice.chotard@foss.st.com>
 <9ad4b4a8-988e-f185-f80c-6f15f341ce8c@linaro.org>
 <79fd7e19-ceef-14fb-5a83-603740735f8f@foss.st.com>
 <38c3977a-0196-1832-ff94-317064cbc439@linaro.org>
In-Reply-To: <38c3977a-0196-1832-ff94-317064cbc439@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: spi: stm32: Add st,
 dual-flash property in st, stm32-qspi.yaml
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

On 09/08/2022 07:18, Krzysztof Kozlowski wrote:
> On 08/08/2022 19:08, Patrice CHOTARD wrote:
>> Hi Krzystof
>>
>> On 8/8/22 11:01, Krzysztof Kozlowski wrote:
>>> On 08/08/2022 10:40, patrice.chotard@foss.st.com wrote:
>>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>>
>>>> Add new property st,dual-flash which allows to use the QSPI interface as a
>>>> communication channel using up to 8 qspi line.
>>>> This mode can only be used if cs-gpios property is defined.
>>>>
>>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>>> index 6ec6f556182f..5e4f9109799e 100644
>>>> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
>>>> @@ -46,6 +46,14 @@ properties:
>>>>        - const: tx
>>>>        - const: rx
>>>>  
>>>> +  st,dual-flash:
>>>> +    type: boolean
>>>> +    description:
>>>> +      Allows to use 8 data lines in case cs-gpios property is defined.
>>>
>>> It's named dual-flash, but what if you want to use QSPI to connect for
>>> example to FPGA?
>>>
>>> Also how is this related to parallel-memories property?
>>
>> I called it "dual-flash" simply because it enable the dual flash feature of the QSPI block (bit CR_DFM : Dual Flash Mode)
>> which allows to use the 8 lines simultaneously of our dual QSPI block.
> 
> And how is it related to existing parallel-memories property?

Maybe I was not specific enough, so let me rephrase - we have already
parallel-memories property. How this one is different (to justify the
new property)? Is just one memory connected in your case to QSPI over 8
data lines?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
