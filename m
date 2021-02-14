Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F1B31B16C
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Feb 2021 18:07:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C02DC5719A;
	Sun, 14 Feb 2021 17:07:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC908C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Feb 2021 17:07:52 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05ECA64DBA;
 Sun, 14 Feb 2021 17:07:47 +0000 (UTC)
Date: Sun, 14 Feb 2021 17:07:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210214170743.090e8b60@archlinux>
In-Reply-To: <58e7c59bb7c7bb94c8655903308842d9d9e9907a.1613131238.git.vilhelm.gray@gmail.com>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <58e7c59bb7c7bb94c8655903308842d9d9e9907a.1613131238.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 09/22] counter: Return error code on
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

On Fri, 12 Feb 2021 21:13:33 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> Only a select set of modes (function, action, etc.) are valid for a
> given device configuration. This patch ensures that invalid modes result
> in a return -EINVAL. Such a situation should never occur in reality, but
> it's good to define a default switch cases for the sake of making the
> intent of the code clear.

In many of these cases it may make sense to also return early
in the good paths rather than share a return 0 at the
end of the function?


> 
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: David Lechner <david@lechnology.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/104-quad-8.c            | 10 ++++++++++
>  drivers/counter/microchip-tcb-capture.c |  6 ++++++
>  drivers/counter/stm32-lptimer-cnt.c     | 10 ++++++----
>  drivers/counter/stm32-timer-cnt.c       |  3 +++
>  drivers/counter/ti-eqep.c               |  3 +++
>  5 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> index 9a96296b0625..674263b4d2c4 100644
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
> @@ -367,6 +371,9 @@ static int quad8_action_get(struct counter_device *counter,
>  	case QUAD8_COUNT_FUNCTION_QUADRATURE_X4:
>  		*action = QUAD8_SYNAPSE_ACTION_BOTH_EDGES;
>  		break;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
>  
>  	return 0;
> @@ -529,6 +536,9 @@ static int quad8_count_mode_set(struct counter_device *counter,
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
> index 710acc0a3704..ee979b011012 100644
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
> index 937439635d53..daf988e7b208 100644
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
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index ef2a974a2f10..431a3d08ed6c 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -296,6 +296,9 @@ static int stm32_action_get(struct counter_device *counter,
>  		/* counts up/down on both TI1FP1 and TI2FP2 edges */
>  		*action = STM32_SYNAPSE_ACTION_BOTH_EDGES;
>  		break;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
>  
>  	return 0;
> diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
> index a60aee1a1a29..7844fdf78a97 100644
> --- a/drivers/counter/ti-eqep.c
> +++ b/drivers/counter/ti-eqep.c
> @@ -192,6 +192,9 @@ static int ti_eqep_action_get(struct counter_device *counter,
>  			break;
>  		}
>  		break;
> +	default:
> +		/* should never reach this path */
> +		return -EINVAL;
>  	}
>  
>  	return 0;


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
