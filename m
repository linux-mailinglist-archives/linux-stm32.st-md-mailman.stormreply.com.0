Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C333E6CB8CE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 09:56:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 729AFC6A5EF;
	Tue, 28 Mar 2023 07:56:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E648C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 07:40:09 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r29so11081623wra.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679989209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qYSKi6P9F33q3cGk3dc2X+3QTPP68ecCLe041fZqdtM=;
 b=HbSxQr4r8Zf3+yFQGbqcSxzOtKd8vj2cIF9+ve9dHjUlZoMwR8DYHXDG3+N4uRe0Vd
 y0tyA33+FCOrO1XVTYqLMCQaVei6b+K0kcXheOPsVWLV4HEKyUxEQf1Z835o14j9bacp
 ghe9VyKKvUiP1a7uUEtkJuyjM+AOUdFwrLJWU7Q3Au0XD5DV4t0QUX5irMgq4g1YTI75
 5fGfeDGJnMAmrLjC4zaBRLAACxa02wIPHGF48zub+woOFOA0kqTGgHJq1xBs+FeNbLW7
 h5cPb4t6yvBDTFgqAtUzrgUlRqccvDftKeSJUDmZZTvjxIVqSo3FDfDz142jvg4L4KaV
 AbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679989209;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYSKi6P9F33q3cGk3dc2X+3QTPP68ecCLe041fZqdtM=;
 b=0Atnk98w6PMYGWgttAoG3CXw06UiLFV1OksUtbJNYur6n5IuXYNXZ1cza3ypIix6yL
 MslFOY5tQkhh4+Hxy+NVdkLu6WXjZJ06X77CbF3P52QX3cTFGBO2VEPtIm5eFGXZO8OR
 uIrp8uhQ2S8hEwX3EC6QOnYnciTHWuesK9Ye32Ue+vbFU8JcRWQobi0KW9BUfEV9H4So
 8n6+XKRuh7I3Po7x6g8Xw1n21g4G6lwCIUUkRBGQFsx/mGzWPBGYlddj8+zS8NlMiMke
 VFhWDOSIZFvpzwNG4QyHhLJ3GfU0j2xORjqKQllFViVsnQWYdMTux4Rm3PTFhVq0DVhc
 AXuw==
X-Gm-Message-State: AAQBX9dB147M9t4dLApI1UkQmsPRhoQvYv/ornh8Z8dWBDYhLjBVywzK
 pkuRLPHu6C2Jj6FTxCUFWd8=
X-Google-Smtp-Source: AKy350ZblYUnLPCJxBsWxVjLmOt7Surp3uSMJdu3VZiB82QN73WYQMcps/WK/CciM1DKpYZAGC5tMA==
X-Received: by 2002:adf:fe45:0:b0:2c7:d7c:7d7 with SMTP id
 m5-20020adffe45000000b002c70d7c07d7mr11055389wrs.22.1679989208657; 
 Tue, 28 Mar 2023 00:40:08 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d6d46000000b002c5598c14acsm27215726wri.6.2023.03.28.00.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 00:40:08 -0700 (PDT)
Date: Tue, 28 Mar 2023 10:40:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yu Zhe <yuzhe@nfschina.com>
Message-ID: <4b64c2ed-b3a3-46fc-b5c7-3c03b30cd8a2@kili.mountain>
References: <20230320061157.29660-1-yuzhe@nfschina.com>
 <20230328015749.1608-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230328015749.1608-1-yuzhe@nfschina.com>
X-Mailman-Approved-At: Tue, 28 Mar 2023 07:56:36 +0000
Cc: liqiong@nfschina.com, kernel-janitors@vger.kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3] remoteproc: remove unnecessary (void*)
	conversions
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

On Tue, Mar 28, 2023 at 09:57:49AM +0800, Yu Zhe wrote:
>  static void devm_rproc_free(struct device *dev, void *res)
>  {
> -	rproc_free(*(struct rproc **)res);
> +	rproc_free(res);

This introduces a bug.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
