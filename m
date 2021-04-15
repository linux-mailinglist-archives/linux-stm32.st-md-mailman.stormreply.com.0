Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56064360E4D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:14:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F2EEC57B79;
	Thu, 15 Apr 2021 15:14:46 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5005AC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:14:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id j7so7701187pgi.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ax39KJeRsWzONrhn+72TkNapDpAhRxhVHYcwUNfI7/8=;
 b=dZXTlmwxnwELuSG5gVg7O/1XlkljIXnmaZxoSsrmXYAif0qd0cS2nLBV31LseGwAww
 08AZo0PIV9odOFgEtGAoQWBGVis/cpRaldCoMSgWx0i8u3k4eVdGECk2soddkRtwXr8W
 goG25yIsWtbaRs4263s3TAzPuDz4xEVthaSwE0PSnmyj2wnXsT4D3uqzUe74laAsfCR3
 MQSfG5xqP9CGq5I/QyeX62oZhM24rciIbTqtir2WC5A6knnDxSt7RtEd+shZndTNr08p
 mpUHl+Wi+PbhhT5515odVLZx/3VzDUQWi+fZApvrNtlCzuIaZIE/IU4atSpxhtB0XLJd
 qUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ax39KJeRsWzONrhn+72TkNapDpAhRxhVHYcwUNfI7/8=;
 b=E7r4bfgqpRTyJ+6Do6DFSlCLT0GCVN78wnTEgK6au0NRZ49Ch6CZPWN4abXTneTahw
 GwRk41ghq7hD/OY0gEBVNT3BaCSpHekoMgSRAKBERnM/5xNQ24zljNQBiLI05rU/UpUb
 25MIheQux0YxNQfdYGvPlyyC5vSI3/5Fcq0AZRJG2pfN2dqkd6JXz7vqDe5bRpJHMJLv
 8hl/9ZgbX0j/JIIRqwbzYa6KE+TnMAFPIjOfz1qsH1BxbVQ57qGGRniK+XVZgkZ2ZBmS
 q760pP+64rYwT/ACW/meaUXgOHFv58Tfp9qRwJdLbtUgejDqW91KJODrdD1VTwNqtJi9
 IGhQ==
X-Gm-Message-State: AOAM531bJNuPxvdfdhkENchT+EFaM9WB+/PJhRVHx8ZIxgVC7DLRkDF1
 YXcVYSpD4QC+0enViOwqMHk=
X-Google-Smtp-Source: ABdhPJy7h45A/JGY8V4v3PNXukYZA8GUaHq8q5XZTPvNARGrwJyJ1oIa8vavVXfsZ1NSqZbWbAyD3Q==
X-Received: by 2002:aa7:864d:0:b029:24b:dd03:edec with SMTP id
 a13-20020aa7864d0000b029024bdd03edecmr3764464pfo.18.1618499683934; 
 Thu, 15 Apr 2021 08:14:43 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id u5sm684396pfn.155.2021.04.15.08.14.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:14:42 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:44:31 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151431.GB8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <98676f9a2e9cf991d7a002b3b264cca774e5b3c8.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98676f9a2e9cf991d7a002b3b264cca774e5b3c8.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 04/33] counter: 104-quad-8: Return
 error when invalid mode during ceiling_write
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

On Fri, Mar 19, 2021 at 08:00:23PM +0900, William Breathitt Gray wrote:
> The 104-QUAD-8 only has two count modes where a ceiling value makes
> sense: Range Limit and Modulo-N. Outside of these two modes, setting a
> ceiling value is an invalid operation -- so let's report it as such by
> returning -EINVAL.
> 
> Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic interface")
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 4bb9abffae48..233a3acc1377 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct counter_device *counter,
>  	switch (priv->count_mode[count->id]) {
>  	case 1:
>  	case 3:
> +		mutex_unlock(&priv->lock);
>  		quad8_preset_register_set(priv, count->id, ceiling);
> -		break;
> +		return len;
>  	}
>  
>  	mutex_unlock(&priv->lock);
>  
> -	return len;
> +	return -EINVAL;
>  }
>  
>  static ssize_t quad8_count_preset_enable_read(struct counter_device *counter,
> -- 
> 2.30.2
>

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
