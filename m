Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD15360E8D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:17:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75209C57B79;
	Thu, 15 Apr 2021 15:17:30 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC427C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:17:28 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f29so17123103pgm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pqvughkl2U3sNrUOp5/BQIl3EtqX5v4D36UESHq6XxI=;
 b=ZLeuNCpgMvYWfWuOgwjPr7Cf8KUdN8cCNqyp8fB9UBdYrNF1jNFznBPjf9rwzf9nFR
 5PHeeeIQcc5HvY+Vk6QrJ9EvQxde5PB11U2mx04I+k/YRDzBvMTxSa58wdDPLu2Xl+on
 JkCuglzKGBqBWJ7PWbHJT8QJOJh9P/keTBljuIhfnt4hx/yS89xYQCrD9syl0PoTnHzY
 Y38tgKsb27a9hMQanI5OBr+XwcC2x731Tl3bqSkmkpFaKgQ48pxsT+m+fmniv6RPh4Gs
 dnByGC7B4yKMbGCF8y6a7im8SmFShLkObEAdpIAkFdoJ5qITRJVq5rFXus6J9wCrztEG
 6G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pqvughkl2U3sNrUOp5/BQIl3EtqX5v4D36UESHq6XxI=;
 b=gRhN8yJa9NA+qQkX38fOju0X2HdhP+aQW3e++Lxb7PIsDQox0K9IWRulZma8OHLg8V
 0bhxZjBif4I53SQ9T7GfK2kPKkg3cVt2XUB1UzRYnlB0foch29rVeTP//p1X7YLzfnL7
 0M4sdeFj8cgwPuqfg60KrjdyqOMrtfcOMxaz1/v5EWEzVNvJ/k4imzhLU4P5YrWJflxv
 VJ8qRwgl/PaeeYWcIau8zmYyjIHC/B+jSz5QSqjii878yhCvkM24Fsh8yfOt0R8GHdwi
 v3a6SpYNIm8Et3QTjwybuDkuQCCejs1RiwhuGghcvE4FBNjH72bvPkJMwpN8GY+VRWkT
 //9A==
X-Gm-Message-State: AOAM530TSgLkA/t7mzop/4yvW9kOb1QJwh5eVZvilCE79nrTaXUtKRyu
 aE06gOjIdHKJ5hY2II7z5q4=
X-Google-Smtp-Source: ABdhPJw9RfWCve4tuPvWcxnZszPpQBIDcBfoCjS8aUF0YN1sMeYniNrvO8KBuCLifuBM6oW3x3WSKw==
X-Received: by 2002:aa7:9316:0:b029:244:7616:edc7 with SMTP id
 22-20020aa793160000b02902447616edc7mr3676280pfj.19.1618499847345; 
 Thu, 15 Apr 2021 08:17:27 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id k3sm2569617pfh.12.2021.04.15.08.17.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:17:27 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:47:16 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151716.GE8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <c3d989972172945bbc616c973c1a759df5fa3d19.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3d989972172945bbc616c973c1a759df5fa3d19.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 07/33] counter: 104-quad-8: Add const
 qualifier for functions_list array
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

On Fri, Mar 19, 2021 at 08:00:26PM +0900, William Breathitt Gray wrote:
> The struct counter_count functions_list member expects a const enum
> counter_count_function array. This patch adds the const qualifier to the
> quad8_count_functions_list to match functions_list.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 51fba8cf9c2a..ae89ad7a91c6 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -193,7 +193,7 @@ enum quad8_count_function {
>  	QUAD8_COUNT_FUNCTION_QUADRATURE_X4
>  };
>  
> -static enum counter_count_function quad8_count_functions_list[] = {
> +static const enum counter_count_function quad8_count_functions_list[] = {
>  	[QUAD8_COUNT_FUNCTION_PULSE_DIRECTION] = COUNTER_COUNT_FUNCTION_PULSE_DIRECTION,
>  	[QUAD8_COUNT_FUNCTION_QUADRATURE_X1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X1_A,
>  	[QUAD8_COUNT_FUNCTION_QUADRATURE_X2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
> -- 
> 2.30.2
>

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
