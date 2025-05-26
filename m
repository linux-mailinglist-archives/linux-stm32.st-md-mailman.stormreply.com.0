Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B557DAC3FAD
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 14:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 748A2C36B2C;
	Mon, 26 May 2025 12:54:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 206B4C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 05:39:23 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-23446bb8785so10523525ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 May 2025 22:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748237962; x=1748842762;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dLp6cnqyCbjFDWsg2nybeJcpM5tSNUhvPi8JJGmzqF0=;
 b=EvHmwIhi4Tt8pIEoa2ifOd+YD6nL5SbIA3TxYIaRsbZdUy/IHjDCSH97iaWkJOgQth
 572HZ0fo6CgkBE+N3AAZSUpPh0kokES//TfOdOZaDZqIfcQDZt00ZXU0cbdUxDKL4MJr
 4lv0+3bBp61OYte71D8dJAmxyz3PkKrtloCygQthLnaZkmnoHbM7gkBPpc4agmDgdycJ
 0eWXRh5K+tSQc9ltZm/kW3a9SU13sbCODuGU5KY1nrNJCf4Jq5/dB/wNm8MVL9m1kxUY
 5pa3Cu6WpyO8rlLtxxS2XH+126oEtABHifsadFEXfk/vS4s8/fCeFmyHJzcbfjWQA9K7
 Uh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748237962; x=1748842762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dLp6cnqyCbjFDWsg2nybeJcpM5tSNUhvPi8JJGmzqF0=;
 b=V+8rtjzdkDEioen3bDmjuKRZbvnnlCSsmbsjHgKmj26cDlyALuYp+YY3l3bFmeUPFb
 dA0GKvGTa1+u1Rr6zP3q2abp7IAMMViTs3cDrqluWuJlsOrDusCOVEzmUqkufi3eeUZT
 +DqSaNO8UNwzEVQgU4AHw3+pbjt1J3Cs1oRCrU2CWjKQa8629qaGQIrOzH9U1S9oSzpA
 hDPlU2TKst65/WA1YeGpCQ344mEI5gPtcPPw5TmIZ0OLnBofEnxlIdNJG+H+Kx1rkuBb
 m3YgDb4jetj6WsrNDWm/dYyexNYwH+fkqgovIgTXmxnmWX+dsiDU+eXgZzXxi08cY+OU
 8wSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4WD5lEuoDA7itasR1QL+FhwEzcTbMwJSumxNN33lsIamPt6VTuCJ0ynqO5L7vCswrhppeC+xRVm/VMw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzN6b68/i1yIakyJ5raz6PZiPd+P+h2cwWsZX0O2qIVqbWbYXfu
 IqVb/LsYo6gyW+G+6F3dJRxtnWwo42y5R792pzTBheCsyzLaTgrB5hip
X-Gm-Gg: ASbGncsVZxyIcMlqS3naVFVQPPytCJrZtp4CMaGKOhJU1NFuQcGBta0JCM32iE9avwo
 shJyZYDg9xl/0Y7Vs7L/Vl2ERLqurCYkACGZLMfZRbSJ9yIF3Oomf9nYYq7mXpMIP2IukbQjVWb
 1uZXVQvCnS+f4OfQEwfXQhLT/mhyiVltxI7sUiVBvPuuYnmyn7vZ5AYtAm4uvOjrWlNnKH6O3jQ
 SuFXC8pevrD5owfI8kZ79QMkCBUh7xN5ZHoD709QCA1/Vz7hYq+meuY7lcVWN8FeDSdAVQULMTW
 sbIfDShxBSKM+YvL2WVkQCR2iflcp8o+GL57xTe8HjgRDE47PiTTvqWCUTnV0ufzVVDVExEyWK0
 38fkBuPBXJ2J45RhyQaHkhWl2+4dk
X-Google-Smtp-Source: AGHT+IG7xgzxnz1Grj9UzPDie6FzHib+saLpOZH8onxhz75DWnCGce9JBep2Vj0Bc2x5YD1GmylXew==
X-Received: by 2002:a17:902:eccb:b0:22e:3f1e:b8c8 with SMTP id
 d9443c01a7336-23414f5cceamr132744715ad.15.1748237962243; 
 Sun, 25 May 2025 22:39:22 -0700 (PDT)
Received: from [0.0.0.0] (ec2-54-193-105-225.us-west-1.compute.amazonaws.com.
 [54.193.105.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2343635891bsm22297405ad.130.2025.05.25.22.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 May 2025 22:39:21 -0700 (PDT)
Message-ID: <705d99b3-9803-4f5f-a807-607b49349b68@gmail.com>
Date: Sun, 25 May 2025 22:41:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, jszhang@kernel.org, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011040.801-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20250516011040.801-1-weishangjuan@eswincomputing.com>
X-Mailman-Approved-At: Mon, 26 May 2025 12:54:05 +0000
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 linmin@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] ethernet: eswin: Document for
	eic7700 SoC
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

On 5/15/25 18:10, weishangjuan@eswincomputing.com wrote:> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting
> multi-rate (10M/100M/1G) auto-negotiation, PHY LED configuration,
> clock/reset control, and AXI bus parameter optimization.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---...> +  # Custom properties
> +  eswin,hsp_sp_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: HSP SP control register> +...> +additionalProperties: false
> +
> +  eswin,syscrg_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: System clock registers
> +
> +  eswin,dly_hsp_reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: HSP delay control registers
...
> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {...> +        dma-noncoherent;
> +        eswin,hsp_sp_csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
> +        eswin,syscrg_csr = <&sys_crg 0x148 0x14c>;
> +        eswin,dly_hsp_reg = <0x114 0x118 0x11c>;

Please help explain the meaning of eswin,<reg> array, and also the expected
number of elements in it, like what starfive did to their JH71x0 device-
tree bindings. E.g., this is what net/starfive,jh7110-dwmac.yaml looks like:

...
   starfive,syscon:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
           - description: phandle to syscon that configures phy mode
           - description: Offset of phy mode selection
           - description: Shift of phy mode selection
     description:
       A phandle to syscon with two arguments that configure phy mode.
       The argument one is the offset of phy mode selection, the
       argument two is the shift of phy mode selection.
...

Otherwise, there's no way for people to reason about the driver code.
The same should apply for your sdhci/usb/pcie/... patchsets as well.
Also there's no reference to the first element of the hsp_sp_csr array.
 From the vendor code, I'm reading that you are using the first element
as the register to set the stream ID of the device to tag the memory
transactions for SMMU, but in the patch, there's no mentioning of it.
I'm guessing you are planning to upstream that part later. If so, I
think it's better to put that register index at the end of the array,
and make it optional. It should then be properly documented as well.

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
