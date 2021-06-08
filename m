Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910633A010D
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 20:57:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1733CC57B79;
	Tue,  8 Jun 2021 18:57:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BA17C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 18:57:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o127so2495740wmo.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 11:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zR+JC/2SzttVA6Wi+7iVGlwak4IerMBJeQ5vLiMBGTE=;
 b=aCAfFsjvN26ao1o5VbYA1hb4S5BPr3VSPmBYi+tPbj+6rNMp+HtfA3naWv3DEkYR8u
 gcoTAeKJl3oWKupFwMct7p1SNfqDPlIHjPdaMbsgh4cBZ9qQozuUoGWeBnhbiyA6+lm9
 2IboWynabOYoqfxcioZtSNb/o6WuSDo2pRGgfpGXBiQBgZlb/2WINKFNdFFQrhfIvyvN
 SVmX8d/BtmV2n30TpS1q9Ak27Lu9/KTYFz9+HDw1wYADWLUkkIvHQ8UTpe2eM0uS+ABP
 AicSK+tPE0hIc5tyaE6g8uBV0vwT5dj3ML0LRh27ZHXjW6StvDCa2Tqi1Ngl2w8jkiqd
 8pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zR+JC/2SzttVA6Wi+7iVGlwak4IerMBJeQ5vLiMBGTE=;
 b=csyJ0hc+fp7e/aYh/kJMQL14Em6l2jWf5J1CcZRkVorp5QRNHK9dkUmRr7+UM+HR3g
 Pa0vqk/eoLmVmFKzYa+Uob2kL6NRhnyPUW74dxGVnaFM49zkjmHkv0zArMsBWXhAb+gZ
 o903xMChILtkpm49xQKaKS27KC7jq1mvVvCI/j0xbxpIYwKnMbnP9neEe1ogzDf8k+cK
 2P7av5SCb09frmtEjl2BBKEpKWa9ApDfbfJ8x6d49xhRXSUOiIr7vhV1koP/PTb3PNot
 PUsbK9HdzZOxh4v03ZgKv56jlwpLlEbyUqrZp68qH+NGJpEdGnJwlznhmUrsEL39BxwZ
 fcCg==
X-Gm-Message-State: AOAM530Lzs8qNjxBEB5VvLFE/XizCRWtM7E55dsWqreWLumIi3Nfm0ay
 OeFl48D8YIbFl3JV2Utck3k=
X-Google-Smtp-Source: ABdhPJw4vJl+POy6CcWej23a3H9QQOC6ZezJQemdBY1dxn4yCgZHjAn5j8tYrqgir5u1r4h6c0FEAw==
X-Received: by 2002:a05:600c:8a6:: with SMTP id
 l38mr23602133wmp.108.1623178623426; 
 Tue, 08 Jun 2021 11:57:03 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
 by smtp.gmail.com with ESMTPSA id q20sm26200223wrf.45.2021.06.08.11.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:57:02 -0700 (PDT)
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <3436f8f0-77dc-d4ff-4489-e9294c434a08@gmail.com>
 <20210606103019.2807397-1-mnhagan88@gmail.com>
 <b89d828a08528aaa07e3527d254785f1e40b9bee.camel@pengutronix.de>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <c223051b-c11c-3c08-055b-544f9e31cf00@gmail.com>
Date: Tue, 8 Jun 2021 19:57:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b89d828a08528aaa07e3527d254785f1e40b9bee.camel@pengutronix.de>
Content-Language: en-US
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, bjorn.andersson@linaro.org,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: explicitly deassert
	GMAC_AHB_RESET
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

On 07/06/2021 10:45, Philipp Zabel wrote:

> On Sun, 2021-06-06 at 11:30 +0100, Matthew Hagan wrote:
>> We are currently assuming that GMAC_AHB_RESET will already be deasserted
>> by the bootloader. However if this has not been done, probing of the GMAC
>> will fail. To remedy this we must ensure GMAC_AHB_RESET has been deasserted
>> prior to probing.
>>
>> v2 changes:
>>  - remove NULL condition check for stmmac_ahb_rst in stmmac_main.c
>>  - unwrap dev_err() message in stmmac_main.c
>>  - add PTR_ERR() around plat->stmmac_ahb_rst in stmmac_platform.c
>>
>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 4 ++++
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
>>  include/linux/stmmac.h                                | 1 +
>>  3 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 6d41dd6f9f7a..0d4cb423cbbd 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -6840,6 +6840,10 @@ int stmmac_dvr_probe(struct device *device,
>>  			reset_control_reset(priv->plat->stmmac_rst);
>>  	}
>>  
>> +	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
>> +	if (ret == -ENOTSUPP)
>> +		dev_err(priv->device, "unable to bring out of ahb reset\n");
>> +
> I would make this
>
> 	if (ret)
> 		dev_err(priv->device, "unable to bring out of ahb reset: %pe\n", ERR_PTR(ret));

Done.

>
> Also consider asserting the reset again in the remove path. Or is there
> a reason not to?

Don't see any issue doing this. As this is a shared reset, the assert will only occur
when the final GMAC is removed, due to the tracking of deassert_count.

> With that addressed,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> regards
> Philipp

Thanks,

Matthew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
