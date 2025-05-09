Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78646AB0D27
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 10:32:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B71AC78F95;
	Fri,  9 May 2025 08:32:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 950E2C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 08:32:08 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a0b308856fso1226126f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746779528; x=1747384328;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=;
 b=ml3GzTWC8T0DSJIkhvcQkTYKadgwXMCsnHLYPesqqoGMrB6KSbcxyCZJOhCshHIsKz
 OFkNxc7FE6x85gM/ywBAKqLyfT6trzcNOhMx3u3ToB2hIQbCkXoysqA6FbyzxBwyr41k
 GQoFZYIovSBlE+HQvQe332hal4f3OImRoXZRqnGgPhNQhG6CuBLqLxHuMgKNLPdzVqtn
 B24CCsSgR2gmtq0B6YTt2u65W+od7jN0oqidkRQ2usyY9/65YU5df8xeUig1xniOQdmN
 8a2qd8oDp0fKgCoIKoohJyTFff1E2jV/zwfWh/HGvknnJzjesRzWizTkAiF1Z2HVLWbp
 uqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746779528; x=1747384328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=;
 b=W04flB0Wnfe2MfJ0wDu4WJbXLfe997E9djtSjut86yB5A5TR2Q+IJRi8+Na3AgTgsn
 hUFpLLKq+FqnsLmZsRcjl3u79RKTGoLs/TuUoZhPkI5gLMovDZp02fD1/RKVfn+doL+j
 uLY2EQZLhicA/bP1bbTMDdHDCDFHm51lKTY0f7+l3ejb+1El/O5StQApSAQBiPc4PQRO
 Rdp67GRgV84j5lLpzy2VG1ZzucVwxXR/2V2zZrIFEcsC3cCrmnElahpMvO+ksNN5aBgU
 qus7zCELuW2oN3RrnAb5QE3oFR2kyOv3BLttQLNtqSJ08VevXMo7RTfJ6THnau9WGWSr
 9vTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4inI0RoOZsHomWw9ensAKClXloM6IrGk8wvR04w3f1lpomJdSkbKgTPB5n2vruvOd2xKWBPvFbLUtng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5cFchFtziMvY+I5XLe8pAZkFyt4SvBl8RdAdyvtZZhxoGPAsF
 qcsc1S+4piTiMcnV6WTqC3dhdk1bOAmf0Fik41OEuoeS6Panhh6b2Yl8yclhLY8=
X-Gm-Gg: ASbGncvDjm5Oqs8hs0NzoYY8Rz1y+Q3G45RZl+b5XIuYArwrEb4N3zbvWmCKXD4hcqo
 rDI09HUlE6KV53ImzmQgDG61ecYmSYu3tgawUucA7c+iA4cWGolDaGiJgGB4kcM5YdA/fWv+QBf
 De/N5NhNGNT/tWaWDtdRPVeftiIcLNwimBd8yVh+l7k1+apfX2ylvr3iC7F14G1jL7/LRYX3ia3
 2y6NHRMkKLKGVShFj6amkL9veYd1zHxTZRutBYYSYhLPpgAgTAI57ERN4Imr18rm63wiRaVoQjb
 eDeQC//5G8cr35GbePxD/SGwnPWxFOPm/WFTRPyoE+P2YYv07GKtPnPu
X-Google-Smtp-Source: AGHT+IGo7ag956w5i3W9+O4Hysr5DbRbNHyxYYXKoci+clSYLagmnbvGr8QjyCHV5wNtMeLk2ElqtQ==
X-Received: by 2002:a05:6000:2485:b0:39c:13f5:dba0 with SMTP id
 ffacd0b85a97d-3a1f64328bbmr2116798f8f.13.1746779527863; 
 Fri, 09 May 2025 01:32:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f5a4bbf0sm2480709f8f.82.2025.05.09.01.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:32:07 -0700 (PDT)
Date: Fri, 9 May 2025 11:32:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <aB29hOrv0nU73RCn@stanley.mountain>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 2/3] memory: Add STM32 Octo Memory
	Manager driver
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

On Mon, Apr 28, 2025 at 10:58:31AM +0200, Patrice Chotard wrote:
> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		if (enable) {
> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
> +			if (ret) {
> +				dev_err(dev, "Can not enable clock\n");
> +				goto clk_error;
> +			}
> +		} else {
> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +		}
> +	}
> +
> +	return 0;
> +
> +clk_error:
> +	while (i--)
> +		clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +
> +	return ret;
> +}
> +
> +static int stm32_omm_disable_child(struct device *dev)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *reset;
> +	int ret;
> +	u8 i;
> +
> +	ret = stm32_omm_toggle_child_clock(dev, true);
> +	if (!ret)
            ^^^^
I'm pretty sure this was intended to be if (ret) and the ! is a typo.

> +		return ret;

If it's not a typo please write this as:

	if (!ret)
		return 0;

regards,
dan carpenter

> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
> +		reset = omm->child_reset[i];
> +		ret = reset_control_acquire(reset);
> +		if (ret) {
> +			stm32_omm_toggle_child_clock(dev, false);
> +			dev_err(dev, "Can not acquire resset %d\n", ret);
> +			return ret;
> +		}
> +
> +		reset_control_assert(reset);
> +		udelay(2);
> +		reset_control_deassert(reset);
> +
> +		reset_control_release(reset);
> +	}
> +
> +	return stm32_omm_toggle_child_clock(dev, false);
> +}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
