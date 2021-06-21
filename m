Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0A3AE2C8
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jun 2021 07:30:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42D0EC57B6C;
	Mon, 21 Jun 2021 05:30:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C407C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 05:30:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id i4so4186860plt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Jun 2021 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4IlYTzqTiHSSyCrVD+PHTHP/vSzXrM8Iuj5rsEYS1ag=;
 b=Pbv+96vIF+02I2wwcvgORNfYiULcsseOROoTrlSkAdKQ8/0Jt3oHyCsTpSYEpixQa9
 0QcfW+xMj20lELFCZw3O2rZS61pC1kdLQl0qeDJp/c/mw0IKd4G6fmq0LMWvXKOT6g0q
 8bNbSxDCaQPn9FC4iYdH88nTPZyCMlmeA+pQ019Dm41oF6WiYiM3aR+qIYFQjwFIwSbu
 cG/ueNacxVotmLx/0LLZUEP24oAMu6qAq/V8Zj5IEiXkCPlapYJlpGprSHshJtBNz7fH
 dEJJqOaV+PYUmEEYIESe0gUDDDxg5hynZnKc1vnGDiiJX5pYvGd9U8V1yme0RS6atH1L
 IbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4IlYTzqTiHSSyCrVD+PHTHP/vSzXrM8Iuj5rsEYS1ag=;
 b=q+NroPHuFi636ruRJL9s9lr8jzvjLuR+1MFQ6t8vBwGAH3NERXtBPiU4A/P4Tjufds
 d20IdMeOrIemBAtxo5rT+TyaxHKVaWvR5HU47DP8yQeYytm8wNCSsbkOwwfoGsTRLXVG
 za5h7jp66pfklFR4ArAIW50ajl3BTpyMU5LDF6fjeq2cU/PVnmH4R8TK2uDpHeNOQQaM
 Du9kWYaRWljg6raziBcRCh09V3GOH2cBE75VRLxI2hiDDOsE3Sjs8jRAlfy+RGne0q+q
 lULaQXroX5OGsCCqoyXA5eYlE/ChoYOjFwKIWMtX4wUvJDTSWf5GTt3bkO4bsT3XWK8D
 0O6w==
X-Gm-Message-State: AOAM530w6gHb+NENJfjqxkyB9cPtpSC2059K6ojExNN2ruhSTIKZuMXZ
 fq1OnModazbtGF0jldthP2o=
X-Google-Smtp-Source: ABdhPJwxJnLSM4mz1fCQWv4Mof+GiaalZ0RUmJTvO4iQIhAj/uMqCpXrb8enkuozJHLC0dCp8MiF2g==
X-Received: by 2002:a17:90a:901:: with SMTP id
 n1mr35920253pjn.44.1624253410705; 
 Sun, 20 Jun 2021 22:30:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:df5a:b40e:40c9:a3e7])
 by smtp.gmail.com with ESMTPSA id l6sm1210484pgh.34.2021.06.20.22.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 22:30:09 -0700 (PDT)
Date: Sun, 20 Jun 2021 22:30:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sergey Larin <cerg2010cerg2010@mail.ru>
Message-ID: <YNAj30vl2yGxRX4e@google.com>
References: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618145149.10136-1-cerg2010cerg2010@mail.ru>
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: stmpe-keypad - add STMPE1801
	support
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

Hi Sergey,

On Fri, Jun 18, 2021 at 05:51:49PM +0300, Sergey Larin wrote:
> @@ -176,7 +232,9 @@ static irqreturn_t stmpe_keypad_irq(int irq, void *dev)
>  		u8 data = fifo[i];
>  		int row = (data & STMPE_KPC_DATA_ROW) >> 3;
>  		int col = data & STMPE_KPC_DATA_COL;
> -		int code = MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);
> +		int code = variant->read_inverted ?
> +			  MATRIX_SCAN_CODE(col, row, STMPE_KEYPAD_ROW_SHIFT)
> +			: MATRIX_SCAN_CODE(row, col, STMPE_KEYPAD_ROW_SHIFT);

Do we really need to do this swap vs. simply arranging the keymap
differently for 1801?

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
