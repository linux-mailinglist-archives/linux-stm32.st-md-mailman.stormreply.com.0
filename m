Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F39360E97
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 17:19:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6715C57B79;
	Thu, 15 Apr 2021 15:19:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4451BC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 15:19:46 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id u15so3695197plf.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LBsPWbKMibZIZP0spYDnVJJ9XeFtdFxsNH9/u61CIT0=;
 b=t7Fr7sBZtaRzy6h4SJEtUxXbGWu/Ict000/2uHhLl7YXGPTGr9X7AxLMSG33PikVpF
 HwR/RWGhm+FV7Pb4x90fb99Uew1lqgb31Vv2/J/gcAR2HP9VljBW8GC59Umz9E20sao7
 nOy257XjR6AWGQSG+teGPor2jr/EsPeeShCM2vXjs5B3qcwiUKPzX7lib3numuSLxDp1
 773Kh4H2DYbQbT/qgJWIbV05hG4hSANGMUjtDEaKkkqLy0elBny4jx+xlOLsph62S/LR
 7Dq3UbT8dlk31Iqg7Cg/TzPhSRb48g/Y1pdax9SDfI0qdwoQ/v/11hwgtJ8vkYTf1U0p
 4vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LBsPWbKMibZIZP0spYDnVJJ9XeFtdFxsNH9/u61CIT0=;
 b=CeDcUXD55g96s+BmCcTI7ttr7Av4cEY6VeqQJB2JzSByN8f5Hg3iwkAjynwJrC7Axs
 yxTRkpCgP5zM/KeZg9NyT8cUfcpl7ofwU/AWY9pvFi7/nsbEUign8aZuXLLDeJGMLqrF
 twN3/fmej6UAXZfQXkABnNitpIoDWmCbDtqcUgnxrhKH2DkkxSZG/6MXYCmhCXpyvGDB
 wR7v0IhH38OEjrFgRuiwk4W2g/BeCBFx0ikK98nCvwLKNOp/MH1xnoCBNqbRu8VRezXN
 uz5rpvb+G0bN+cSCcn2MqUVxztX6lLV1Ws6TjOp4iq+H3hu7S1GQCBow/0pGW99Bs/zo
 LHJg==
X-Gm-Message-State: AOAM533ARgJ0cp2vpjjWcxHiDZiuJiK/cjTL6Be2gPkMpPM2i9xtaT24
 ykljgIyes3rZI4V1lFSTqWE=
X-Google-Smtp-Source: ABdhPJxTUzaNy/K2Y5YrEVP+tZIuAN1FbphT+vlG5WrudPuiXfMKdZzYF+iqg+DQt6iqwrzTMRd1VA==
X-Received: by 2002:a17:90a:4b8c:: with SMTP id
 i12mr4468436pjh.66.1618499985445; 
 Thu, 15 Apr 2021 08:19:45 -0700 (PDT)
Received: from syed ([2401:4900:2eec:4193:f802:b600:e94c:55c4])
 by smtp.gmail.com with ESMTPSA id 4sm2892328pjl.51.2021.04.15.08.19.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:19:45 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:49:34 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210415151934.GG8933@syed>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <e1dd9e43f713ccaa29e1c05d7b21d86bff02ab34.1616150619.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1dd9e43f713ccaa29e1c05d7b21d86bff02ab34.1616150619.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 18/33] counter: Return error code on
	invalid modes
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

On Fri, Mar 19, 2021 at 08:00:37PM +0900, William Breathitt Gray wrote:
> Only a select set of modes (function, action, etc.) are valid for a
> given device configuration. This patch ensures that invalid modes result
> in a return -EINVAL. Such a situation should never occur in reality, but
> it's good to define a default switch cases for the sake of making the
> intent of the code clear.
> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: David Lechner <david@lechnology.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c            | 20 +++++++----

For the 104-quad-8 driver:
Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>

>  drivers/counter/microchip-tcb-capture.c |  6 ++++
>  drivers/counter/stm32-lptimer-cnt.c     | 10 +++---
>  drivers/counter/ti-eqep.c               | 45 +++++++++++--------------
>  4 files changed, 46 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 09d779544969..b7d6c1c43655 100644
> --- a/drivers/counter/104-quad-8.c
> +++ b/drivers/counter/104-quad-8.c
> @@ -273,6 +273,10 @@ static int quad8_function_set(struct counter_device *counter,
>  			*scale = 2;
>  			mode_cfg |= QUAD8_CMR_QUADRATURE_X4;
>  			break;
> +		default:
> +			/* should never reach this path */
> +			mutex_unlock(&priv->lock);
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -349,7 +353,7 @@ static int quad8_action_get(struct counter_device *counter,
>  	case QUAD8_COUNT_FUNCTION_PULSE_DIRECTION:
>  		if (synapse->signal->id == signal_a_id)
>  			*action = QUAD8_SYNAPSE_ACTION_RISING_EDGE;
> -		break;
> +		return 0;
>  	case QUAD8_COUNT_FUNCTION_QUADRATURE_X1:
>  		if (synapse->signal->id == signal_a_id) {
>  			quad8_direction_get(counter, count, &direction);
> @@ -359,17 +363,18 @@ static int quad8_action_get(struct counter_device *counter,
>  			else
>  				*action = QUAD8_SYNAPSE_ACTION_FALLING_EDGE;
>  		}
> -		break;
> +		return 0;
>  	case QUAD8_COUNT_FUNCTION_QUADRATURE_X2:
>  		if (synapse->signal->id == signal_a_id)
>  			*action = QUAD8_SYNAPSE_ACTION_BOTH_EDGES;
> -		break;
> +		return 0;
>  	case QUAD8_COUNT_FUNCTION_QUADRATURE_X4:
>  		*action = QUAD8_SYNAPSE_ACTION_BOTH_EDGES;
> -		break;
> +		return 0;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
> -
> -	return 0;
>  }
>  
>  static const struct counter_ops quad8_ops = {
> @@ -529,6 +534,9 @@ static int quad8_count_mode_set(struct counter_device *counter,
>  	case COUNTER_COUNT_MODE_MODULO_N:
>  		cnt_mode = 3;
>  		break;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
>  
>  	mutex_lock(&priv->lock);
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
> index 51b8af80f98b..0c9a61962911 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -133,6 +133,9 @@ static int mchp_tc_count_function_set(struct counter_device *counter,
>  		bmr |= ATMEL_TC_QDEN | ATMEL_TC_POSEN;
>  		cmr |= ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_ABETRG | ATMEL_TC_XC0;
>  		break;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
>  
>  	regmap_write(priv->regmap, ATMEL_TC_BMR, bmr);
> @@ -226,6 +229,9 @@ static int mchp_tc_count_action_set(struct counter_device *counter,
>  	case MCHP_TC_SYNAPSE_ACTION_BOTH_EDGE:
>  		edge = ATMEL_TC_ETRGEDG_BOTH;
>  		break;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
>  
>  	return regmap_write_bits(priv->regmap,
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index c19d998df5ba..78f383b77bd2 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -206,9 +206,10 @@ static int stm32_lptim_cnt_function_set(struct counter_device *counter,
>  		priv->quadrature_mode = 1;
>  		priv->polarity = STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES;
>  		return 0;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
> -
> -	return -EINVAL;
>  }
>  
>  static ssize_t stm32_lptim_cnt_enable_read(struct counter_device *counter,
> @@ -326,9 +327,10 @@ static int stm32_lptim_cnt_action_get(struct counter_device *counter,
>  	case STM32_LPTIM_ENCODER_BOTH_EDGE:
>  		*action = priv->polarity;
>  		return 0;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
> -
> -	return -EINVAL;
>  }
>  
>  static int stm32_lptim_cnt_action_set(struct counter_device *counter,
> diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
> index 65df9ef5b5bc..878725c2f010 100644
> --- a/drivers/counter/ti-eqep.c
> +++ b/drivers/counter/ti-eqep.c
> @@ -157,44 +157,39 @@ static int ti_eqep_action_get(struct counter_device *counter,
>  		 * QEPA and QEPB trigger QCLK.
>  		 */
>  		*action = TI_EQEP_SYNAPSE_ACTION_BOTH_EDGES;
> -		break;
> +		return 0;
>  	case TI_EQEP_COUNT_FUNC_DIR_COUNT:
>  		/* In direction-count mode only rising edge of QEPA is counted
>  		 * and QEPB gives direction.
>  		 */
> -		switch (synapse->signal->id) {
> -		case TI_EQEP_SIGNAL_QEPA:
> -			*action = TI_EQEP_SYNAPSE_ACTION_RISING_EDGE;
> -			break;
> -		default:
> +		if (synapse->signal->id == TI_EQEP_SIGNAL_QEPB)
>  			*action = TI_EQEP_SYNAPSE_ACTION_NONE;
> -			break;
> -		}
> -		break;
> +		else
> +			*action = TI_EQEP_SYNAPSE_ACTION_RISING_EDGE;
> +		return 0;
>  	case TI_EQEP_COUNT_FUNC_UP_COUNT:
>  	case TI_EQEP_COUNT_FUNC_DOWN_COUNT:
>  		/* In up/down-count modes only QEPA is counted and QEPB is not
>  		 * used.
>  		 */
> -		switch (synapse->signal->id) {
> -		case TI_EQEP_SIGNAL_QEPA:
> -			err = regmap_read(priv->regmap16, QDECCTL, &qdecctl);
> -			if (err)
> -				return err;
> -
> -			if (qdecctl & QDECCTL_XCR)
> -				*action = TI_EQEP_SYNAPSE_ACTION_BOTH_EDGES;
> -			else
> -				*action = TI_EQEP_SYNAPSE_ACTION_RISING_EDGE;
> -			break;
> -		default:
> +		if (synapse->signal->id == TI_EQEP_SIGNAL_QEPB) {
>  			*action = TI_EQEP_SYNAPSE_ACTION_NONE;
> -			break;
> +			return 0;
>  		}
> -		break;
> -	}
>  
> -	return 0;
> +		err = regmap_read(priv->regmap16, QDECCTL, &qdecctl);
> +		if (err)
> +			return err;
> +
> +		if (qdecctl & QDECCTL_XCR)
> +			*action = TI_EQEP_SYNAPSE_ACTION_BOTH_EDGES;
> +		else
> +			*action = TI_EQEP_SYNAPSE_ACTION_RISING_EDGE;
> +		return 0;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
> +	}
>  }
>  
>  static const struct counter_ops ti_eqep_counter_ops = {
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
