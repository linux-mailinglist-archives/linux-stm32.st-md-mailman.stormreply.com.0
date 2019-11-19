Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB410128E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2019 05:39:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98450C36B0B;
	Tue, 19 Nov 2019 04:39:19 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B374C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 04:39:17 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id w8so2182736pjh.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2019 20:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3Q2xgiO0SCUHCJ01fPdKFNn4jj9dQWkJKPBYAQQCb+M=;
 b=RaG20AKfRfRSNJs29D/cPmOTrEFYL4nPFHgmG5xo24MqBUzPA9NQEETVpH2uFb7Zrs
 OJOYq5t88Af765f3ykzYuaFi1qoYb68ULdaVnvAnmJShKgtwU/zLRNuFRaIuLJykgIRp
 YnzQaZLR17rSR9Aevo+/S+inPEJGDvxiyhlIsrlys7lMUWdBgraaOgjEDCwYnFMF8UGV
 INxfmosBpUAYqmKnb9zYkLLGa1NdIoy1g3EaVL7KWIMiUnAMM5D+OfMeG5PUdkW9DihT
 TsphKiY0fY3NdbTAsKjwwi9dhPriE7wXeLEcYv4nqqaM/qCdAk/xxLEhBsE35Tq5PTLL
 VsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3Q2xgiO0SCUHCJ01fPdKFNn4jj9dQWkJKPBYAQQCb+M=;
 b=kh8uvgM4HNNCH67ETLQ7Ymp1a3EFK6BG2IqRAQ0gnw9+nUB7z4s9X+WshWhwevIev6
 PWtwANwkDjoet1t7I2ORdP18cRGzR57Jl9ERhye/0LZnManeuyMJkPwczZ5WGqTRHq4T
 /VVOeAwCnq5AYaeNd4cDqaUyFR6vJBQ2MPXj6es0nbeNnyTmoNIxFMWsZBkYBAiqrGD2
 vPlkdSFte23m8+GuX5aqic5Ro0xoa5Ua2l3Y3Ug0O74oJ+RaQ1UddEWdlrT8R5aWYDqE
 OE45dQ0kNCTvIKgf4R2OzG7iGlOYZb5+BYBzVPn0MIT/rGLWstLz/oDIhrYREG/iRDXF
 lshA==
X-Gm-Message-State: APjAAAUULaFAd+AmqpUDTslqlK9aWYCaBpHLrEZf1ZsKtgPf363QGTKq
 64LA2OaIDGXaPHb6ukmTok/VJg==
X-Google-Smtp-Source: APXvYqzzV3JKKbYmesiphq/qNjx6W36HWDkmcjzcLqVtGtVM9zWe3dc/jdPtzPqDq4dUmntOc38riQ==
X-Received: by 2002:a17:902:ff14:: with SMTP id
 f20mr32149430plj.225.1574138355290; 
 Mon, 18 Nov 2019 20:39:15 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id j7sm20638171pgl.38.2019.11.18.20.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 20:39:14 -0800 (PST)
Date: Mon, 18 Nov 2019 20:39:12 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20191119043912.GT3108315@builder>
References: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] remoteproc: stm32: fix probe error case
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

On Fri 15 Nov 02:03 PST 2019, Fabien Dessenne wrote:
> +
> +	return 0;
> +
> +err_probe:
> +	for (j = i - 1; j >= 0; j--)

It's idiomatic to just use 'i' itself here. But I applied this as is,
with Mathieu's t-b.

Thanks,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
