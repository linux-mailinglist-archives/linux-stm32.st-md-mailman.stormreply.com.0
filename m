Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB755B801
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 08:49:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04AF7C04004;
	Mon, 27 Jun 2022 06:49:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62059C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 06:03:05 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id eq6so11393636edb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jun 2022 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sigma-star.at; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2JA6OF5giONCzBIvAT6R4r7IVTuA+8tJsxC7EPk7bcA=;
 b=fhfgG34MO+IT6NWt8rwf3YE41k8vuO5mOskGjJ6dAL7wQ4FbbDzTOP8uucNbhn7M2H
 ont0e25yRULr51tOCvV8JWebfaPM9hXuTwmKtSnq4aWv/5f6iwiGX+y5YK1u+mX9OCKX
 9al9eIu7vmVMKYwXaHTc1+IxC4RM1DxBZsbqunBOdqNnpYXQHYU+3kLEg3Ir3mrOoBg7
 +iLp3Vxj1xodQcJKk6XJHgT147kTOSEV2AH/12Oj4BHn607qv9F8H97vtrbu3QiXA84V
 cBdJYfUx/zE9RwdwCzbg/by7eaSrSLLcwJAxBEk13gaMaoblSm7bKwJHvuqCNcYNwC1u
 eXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2JA6OF5giONCzBIvAT6R4r7IVTuA+8tJsxC7EPk7bcA=;
 b=PV2JUrJSAUiurjmCriK99V+ZE6OCF4gElKI/XtiiuHCJh4+jDNVhcTut83KRZUq6Mp
 bdJDIbrPQgXExCBTdBqQslry1CozxAj8ppdqJ8OOTB0Q+DsUPMu75cOLxUoIS+/T6fNx
 zJBgaandnjtaPN7rtedOqoRMQBQ9TQxaGR9ySLM+xILm/aKI1TL417DjB8WoF1Equ9sz
 0jPaFaSrZglGAcpUosATxmaf52LM2VXuEi54IZnwUgFuOpOk7LgvvdPhPfSAPalKEGtz
 mI/CAUFTrjU6MJAWxBDh8o09pkcIKTXK+diwsjpIkXkFrI2gbAv4ht1NRnpO5y7K2Few
 QG/g==
X-Gm-Message-State: AJIora8a8ual31gQ8nA8wA/BvqNRC+qkNYvwLr59uXP6zuaJvtGlE6FG
 TYYG8VdOq3IM/1sOaliQx/+A8Q==
X-Google-Smtp-Source: AGRyM1vzg4Dqa7ba+5JyzVEwAMkquSiLnQj553D+y4oTUcfF+355EaqfbduIYfzvVP8oBM47nGAXPg==
X-Received: by 2002:a05:6402:329a:b0:435:8935:e95d with SMTP id
 f26-20020a056402329a00b004358935e95dmr14596774eda.257.1656309784872; 
 Sun, 26 Jun 2022 23:03:04 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1709066c8700b0070c4abe4706sm4612450ejr.158.2022.06.26.23.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 23:03:04 -0700 (PDT)
Message-ID: <96171ceb-4125-87b5-f029-9beaaa1d1057@sigma-star.at>
Date: Mon, 27 Jun 2022 08:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20220616073943.669332-1-christophe.kerello@foss.st.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220616073943.669332-1-christophe.kerello@foss.st.com>
X-Mailman-Approved-At: Mon, 27 Jun 2022 06:49:49 +0000
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH mtd-utils] nandflipbits: fix corrupted oob
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

Applied to mtd-utils.git master

Thanks,

David
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
