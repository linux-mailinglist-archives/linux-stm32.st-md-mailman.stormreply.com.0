Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC096DC98
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 16:53:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2275FC78013;
	Thu,  5 Sep 2024 14:53:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDAF5C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 14:53:33 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c243ef5322so148205a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725548013; x=1726152813;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZR0iYi2IfJinEuVM0L8yEAQAxrisPIV++kgfxATokkM=;
 b=X1KtS8BB189qT9bJmjyUMtegp6ghipN3MB+SmPRzP0VPZvK3td8es41g4hBNKPezXf
 YZ7C2AaUvlXek2Tr4iXDyINg2rBYAYdg5FjE6R7Exl2GSyVSdOHblRKz6S5dnooNLEBq
 tVy1Yo3Fh5TUyzSpXsw0tXWcsPZ5LuP5xdvcuHQWKAqrC9N4LRus18aQIfFXd24kdF9j
 DgedIMGWoq2ycpcD7ntXAs9h+pIlMubfBFOONZe9EcPvrQI0y/0i9Ks4k7m+qTzmXh2e
 5yUFp5N9l4rRG7xYs8BgD06fRnHKdcY6HcfcPfwJPUmZG83TJR+t44y1tgm4ISqqxRxC
 Vdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725548013; x=1726152813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZR0iYi2IfJinEuVM0L8yEAQAxrisPIV++kgfxATokkM=;
 b=EehG6XkMoV1wySo8wzTqfPh2i6WD7fae+zi1guA2UhCy/Itt3tcrBQslU0bgnvPqa3
 OCKDEpgKN3V7WC1cSzXi+CdqGjNnX7aCamAYUbm4WOzRSrkU01JgMtDC4bWLwnYTU4Q5
 JGP3dGpI+R2udjTCrmJX0Ktt/TAnTh9NsS5oDll8J4Eag8Hijixs7zN5exi1HXdBRKMT
 gEgFn9hZgJ0GLozJqEJdXrJnQP92WcQEZw1zYJ9m7xOzRZ5rzmg1DtratluOWl+OQZfE
 hkoZx/rjg7Fio2fPbAV5BXdlvxhWp/wqJTmSJvgzSpTlCr2JeWrcH61cO0nl2DC6jUH+
 /3xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiBOZTLeL4DcIMaYOKdQk/smWukS2+ekOY02H9NbL+CtQu39+taeiYL8fQuQal8Xlv0YNpT1nBCtnXYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4LXpJsCJV1pelckQQdnsY/kCgVkJfhwRKPyaX+0NtQFkUOQed
 PdzkYd2/F182Py2BamAQ88Y8SfRJ+NLvbB5Az4DUXP+619c1+ofX
X-Google-Smtp-Source: AGHT+IHSJDF7488/JNd5/mBRKMIt/AGCz8WaJYYqZBzFyEHSWTtvg92OHespTIAyKntNsE/Yr1Q17g==
X-Received: by 2002:a05:6402:35ca:b0:5c2:4e5b:d0cc with SMTP id
 4fb4d7f45d1cf-5c24e5bd937mr6396914a12.1.1725548012976; 
 Thu, 05 Sep 2024 07:53:32 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a5cfasm1316252a12.92.2024.09.05.07.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:53:32 -0700 (PDT)
Date: Thu, 5 Sep 2024 17:53:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240905145329.bqarpzzaciluwdxi@skbuf>
References: <cover.1725518135.git.0x1207@gmail.com>
 <cover.1725518135.git.0x1207@gmail.com>
 <508ae4f14cf173c9bd8a630b8f48a59a777f716e.1725518136.git.0x1207@gmail.com>
 <508ae4f14cf173c9bd8a630b8f48a59a777f716e.1725518136.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <508ae4f14cf173c9bd8a630b8f48a59a777f716e.1725518136.git.0x1207@gmail.com>
 <508ae4f14cf173c9bd8a630b8f48a59a777f716e.1725518136.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 7/7] net: stmmac: silence FPE
	kernel logs
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

On Thu, Sep 05, 2024 at 03:02:28PM +0800, Furong Xu wrote:
> ethtool --show-mm can get real-time state of FPE.
> fpe_irq_status logs should keep quiet.
> 
> tc-taprio can always query driver state, delete unbalanced logs.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
