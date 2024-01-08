Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A8827A04
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 22:12:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C5BBC6DD73;
	Mon,  8 Jan 2024 21:12:07 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1781C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 21:12:05 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-7cc0d31fd85so558930241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 13:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704748324; x=1705353124;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YBGJtvh92bb/MQJAenOPY/iQdorsefTTda6AN+tF6dQ=;
 b=tbnnXmBfQ3eLH8abBEbP21sga5i3c2ZR/TXbzgf1rOoCM3TSJ43K+dHEtFKdqlRFgQ
 21R0jyCgHtxSFecJdP5Dk34BjGy4hWT6OXp5Z+7oF1MoOa3pcw4w4+RCREdtlw8dgJ5s
 udIk7/aZ/Ip9NzlrHEMILYQIbkorUmnksxLNN+Sv21hHZIMGPTx7e3vU2JlBJl30mfqQ
 Mr86/eVR7MyYB1Vn/gOttYzqsbejJiYE3lxDvX7NKVjoYkg0InKCM8uTJkLOXAQHt65C
 9feAnSUvvVEcttKDUC7mS53YI7+z0+mxRDE22aJ7RG+HNMzZgE8s2CBuD8OMfmJ9fPYc
 qfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704748324; x=1705353124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBGJtvh92bb/MQJAenOPY/iQdorsefTTda6AN+tF6dQ=;
 b=Hz2zUya5Ezi0WPaYBnT9SR0wAw+w9rZr0mfCzQjlIH3rvWTwrlED1WPSRjBTEjla4Q
 xn1rhFq608hrNPy3oaxmP195Iqjg7uDPG1CK3QLqgUQJlSOQFhmVX1mGqmFiciXIYomZ
 oiI2dx9y8JiK7dA/f0/Pdn2jAs4OQhpg4t6Bwmd0bol3h2qoYxCI27pi1kksF3uAoeG8
 0LTA+Ao1cnKLhktTiVid1VfTf4vPWglsgoCe2fu0A/CaWWGRm0Ako6HYQUiYEZNDKh3s
 dMWMvSOSWqy6GNW+uk8nPbXr8sCPt0k7tH/S4Q1JCMTenbL7g++GJB/DDuYLzJ22usec
 DQdg==
X-Gm-Message-State: AOJu0YwQKNg/LsbP4o4s38D6mN4ZFth6elPRLc7PhmO8IxeESCnZy6y3
 a1rHDWFz6wu56uNUNh3Vx0sEVeHJEHaSvA==
X-Google-Smtp-Source: AGHT+IH3EQQvsaMhKI85+JDKyxLi0PolQ2SDP4LRpa4fw3WIbC3ZktiUYL5iLbnJ2jlU4GzE/GMXnw==
X-Received: by 2002:a05:6102:158e:b0:467:da9e:3bd0 with SMTP id
 g14-20020a056102158e00b00467da9e3bd0mr929523vsv.23.1704748324588; 
 Mon, 08 Jan 2024 13:12:04 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05610209d300b0046695b658dcsm92939vsi.30.2024.01.08.13.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 13:12:04 -0800 (PST)
Date: Mon, 8 Jan 2024 21:06:52 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZxj7BpXFyGbcrpi@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-10-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-10-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 09/10] counter: stm32-timer-cnt: add
 support for overflow events
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
Content-Type: multipart/mixed; boundary="===============7197293636884614288=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7197293636884614288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eTyfW+fM+V9Seofn"
Content-Disposition: inline


--eTyfW+fM+V9Seofn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 20, 2023 at 03:57:25PM +0100, Fabrice Gasnier wrote:
> diff --git a/include/linux/mfd/stm32-timers.h b/include/linux/mfd/stm32-timers.h
> index ca35af30745f..9eb17481b07f 100644
> --- a/include/linux/mfd/stm32-timers.h
> +++ b/include/linux/mfd/stm32-timers.h
> @@ -41,6 +41,11 @@
>  #define TIM_SMCR_SMS	(BIT(0) | BIT(1) | BIT(2)) /* Slave mode selection */
>  #define TIM_SMCR_TS	(BIT(4) | BIT(5) | BIT(6)) /* Trigger selection */
>  #define TIM_DIER_UIE	BIT(0)	/* Update interrupt	   */
> +#define TIM_DIER_CC1IE	BIT(1)  /* CC1 Interrupt Enable    */
> +#define TIM_DIER_CC2IE	BIT(2)  /* CC2 Interrupt Enable    */
> +#define TIM_DIER_CC3IE	BIT(3)  /* CC3 Interrupt Enable    */
> +#define TIM_DIER_CC4IE	BIT(4)  /* CC4 Interrupt Enable    */
> +#define TIM_DIER_CC_IE(x)	BIT((x) + 1) /* CC1, CC2, CC3, CC4 interrupt enable */
>  #define TIM_DIER_UDE	BIT(8)  /* Update DMA request Enable */
>  #define TIM_DIER_CC1DE	BIT(9)  /* CC1 DMA request Enable  */
>  #define TIM_DIER_CC2DE	BIT(10) /* CC2 DMA request Enable  */
> @@ -49,6 +54,7 @@
>  #define TIM_DIER_COMDE	BIT(13) /* COM DMA request Enable  */
>  #define TIM_DIER_TDE	BIT(14) /* Trigger DMA request Enable */
>  #define TIM_SR_UIF	BIT(0)	/* Update interrupt flag   */
> +#define TIM_SR_CC_IF(x)	BIT((x) + 1) /* CC1, CC2, CC3, CC4 interrupt flag */
>  #define TIM_EGR_UG	BIT(0)	/* Update Generation       */
>  #define TIM_CCMR_PE	BIT(3)	/* Channel Preload Enable  */
>  #define TIM_CCMR_M1	(BIT(6) | BIT(5))  /* Channel PWM Mode 1 */
> @@ -60,16 +66,23 @@
>  #define TIM_CCMR_CC1S_TI2	BIT(1)	/* IC1/IC3 selects TI2/TI4 */
>  #define TIM_CCMR_CC2S_TI2	BIT(8)	/* IC2/IC4 selects TI2/TI4 */
>  #define TIM_CCMR_CC2S_TI1	BIT(9)	/* IC2/IC4 selects TI1/TI3 */
> +#define TIM_CCMR_CC3S		(BIT(0) | BIT(1)) /* Capture/compare 3 sel */
> +#define TIM_CCMR_CC4S		(BIT(8) | BIT(9)) /* Capture/compare 4 sel */
> +#define TIM_CCMR_CC3S_TI3	BIT(0)	/* IC3 selects TI3 */
> +#define TIM_CCMR_CC4S_TI4	BIT(8)	/* IC4 selects TI4 */
>  #define TIM_CCER_CC1E	BIT(0)	/* Capt/Comp 1  out Ena    */
>  #define TIM_CCER_CC1P	BIT(1)	/* Capt/Comp 1  Polarity   */
>  #define TIM_CCER_CC1NE	BIT(2)	/* Capt/Comp 1N out Ena    */
>  #define TIM_CCER_CC1NP	BIT(3)	/* Capt/Comp 1N Polarity   */
>  #define TIM_CCER_CC2E	BIT(4)	/* Capt/Comp 2  out Ena    */
>  #define TIM_CCER_CC2P	BIT(5)	/* Capt/Comp 2  Polarity   */
> +#define TIM_CCER_CC2NP	BIT(7)	/* Capt/Comp 2N Polarity   */
>  #define TIM_CCER_CC3E	BIT(8)	/* Capt/Comp 3  out Ena    */
>  #define TIM_CCER_CC3P	BIT(9)	/* Capt/Comp 3  Polarity   */
> +#define TIM_CCER_CC3NP	BIT(11)	/* Capt/Comp 3N Polarity   */
>  #define TIM_CCER_CC4E	BIT(12)	/* Capt/Comp 4  out Ena    */
>  #define TIM_CCER_CC4P	BIT(13)	/* Capt/Comp 4  Polarity   */
> +#define TIM_CCER_CC4NP	BIT(15)	/* Capt/Comp 4N Polarity   */

I forgot to mention that you should move the introduction of these
defines to the subsequent patch adding support for capture events
because that's where the defines are actually used.

William Breathitt Gray

--eTyfW+fM+V9Seofn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZxj7AAKCRC1SFbKvhIj
K+hKAQDcvx+8TB+sVsYW8HmeYUBMwLZvZN/fvDizKykS/fZDcQD+JaDR+HGTgp3B
Lc5+qDJlEopQuesY+K90Tw2taDDrxQY=
=S2kh
-----END PGP SIGNATURE-----

--eTyfW+fM+V9Seofn--

--===============7197293636884614288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7197293636884614288==--
