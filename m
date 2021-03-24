Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62D34841F
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Mar 2021 22:49:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB27FC57B5E;
	Wed, 24 Mar 2021 21:49:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A186BC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Mar 2021 21:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=EX6pAaAKbWbCSvkRWiAK+AYx238ttbosxSDxv0Nxz4U=; b=hGHrdg1tj24JzkN1Jc3s0tKyup
 ZpPJiZBoeGVJqd5yuSaTmzfnFdn4IuUEZF6RLizT1OlCqVAJGo+c2sOIB7lY3fP6ncA71M58ecW+B
 /3Cwg+XKraxx++mJJBF+tDAu8ujmg6owsHPEJHKahT6ewC0r1a4z1zGjgCPo7qWGVC/GQmasPORgd
 8o9b3WKXO9ZCI3uYBaAwTDFeLlA5Xqu+1Hpd1gh28JrT0djvC80eduzlhCxbIWSy31205E0NKnv27
 4qr2Fy/n4BsiZlUJfXlCYarLW5qcWVuL2y4iHSNzrPm0wPVgcijlF6+rflzspM4hvEE9QouOzEYM8
 znW76OyQ==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPBNw-000Fuc-4M; Wed, 24 Mar 2021 21:49:52 +0000
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, pierre-yves.mordret@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, p.zabel@pengutronix.de,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d60fd628-d57a-306a-893f-840b16c5f307@infradead.org>
Date: Wed, 24 Mar 2021 14:49:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324140610.32385-1-unixbhaskar@gmail.com>
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH] i2c-stm32f4: Mundane typo fix
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

On 3/24/21 7:06 AM, Bhaskar Chowdhury wrote:
> 
> s/postion/position/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 937c2c8fd349..4933fc8ce3fd 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -534,7 +534,7 @@ static void stm32f4_i2c_handle_rx_addr(struct stm32f4_i2c_dev *i2c_dev)
>  	default:
>  		/*
>  		 * N-byte reception:
> -		 * Enable ACK, reset POS (ACK postion) and clear ADDR flag.
> +		 * Enable ACK, reset POS (ACK position) and clear ADDR flag.
>  		 * In that way, ACK will be sent as soon as the current byte
>  		 * will be received in the shift register
>  		 */
> --


-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
