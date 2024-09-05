Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0928796E4D5
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 23:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE9F1C78013;
	Thu,  5 Sep 2024 21:16:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0380EC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725570999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aCS9FGPb22Zp8YOFZ9hjWeIZgSN7BXU4B9ST/Ivvoxw=;
 b=Kp6HLDMTx52ne0QhuX2BFEU4/I8CgV5Q7vNf1HnPtC6oLUgTVxB0FLaHSZQsttxVBltenv
 5IN7cYtyj1AcK58W1FH2GcQ8Oqcc3O4CaTTFeKqvskNwxKJ9lQ64LXaQVmiEdvvGbAXWIC
 Z+ro4u+uiqjR5XurxaTJLXSAcbgEE9M=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-Qv2GpQ3ZPxKExCzLgqzLlw-1; Thu, 05 Sep 2024 17:16:37 -0400
X-MC-Unique: Qv2GpQ3ZPxKExCzLgqzLlw-1
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-5dfaf2a1a84so1449407eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 14:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725570997; x=1726175797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCS9FGPb22Zp8YOFZ9hjWeIZgSN7BXU4B9ST/Ivvoxw=;
 b=tZ3zP0eOJpKVPPdtrA1KvvUz9RRPjsF6E56GAPChy4TWh5fzIIdYl0x2K6EPPGzaJx
 SLPixccI1h6ZH81QKPnd30lQEJG3o4SiWjhCInMsDTL1VgSzUaHtOW9GDktoX2HTmRfG
 2uxjnyV/MpyD8hlF3WkCJMtk0n3L1NEy0yLcCibchMHBMFGu9iHPelj7NIYkaxCfCiju
 rxlhZCakgwJxjo9TPKfh23hIKb6u9Ayh0UXvn4Yt+VjowsUohccJF4tWSKeS4ePayYBq
 SXNt32lvKmbq42Fw2bz6lN0O2ruNv3ej9/19ruCSemgMdzlaJ+zPOyQnggstEpfQRgBs
 Fkgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlQh5uI+q0VjGbTvCMGCsMaPdRHOF56RJIoMrSid71BeXPE9Z8FH+WvWowDqFK9bcatn774WGoK+hD8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypOo0Fj/ArYJ68UQns2Z0V4eMpMeVi6XyX+DzKwyPGBusfBphO
 Wc4tGj3W/XnwL+Nj1Wi0tx4z99FQJ2DMuNNno7rE21qO+/GCi1/ZIca5cAn5PuY39sPbKaYJGki
 k80jNmxJ+w0k0lZv6rVm0nDEGgd4NtpTHaeC/ypTd/JO5vbIa+I7S1GuTtOHKBeZOmCgSzoNGkI
 tnQQ==
X-Received: by 2002:a05:6820:220f:b0:5dc:a733:d98a with SMTP id
 006d021491bc7-5e1a9d3deaemr460136eaf.7.1725570997214; 
 Thu, 05 Sep 2024 14:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcn3lC302r4cvOynTV/pTYo7UP0omv7LrahF3fXXR7CTInjmYCD99NLWRLjJz2kCarVDyMyA==
X-Received: by 2002:a05:6820:220f:b0:5dc:a733:d98a with SMTP id
 006d021491bc7-5e1a9d3deaemr460105eaf.7.1725570996900; 
 Thu, 05 Sep 2024 14:16:36 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5201e46a4sm11023736d6.53.2024.09.05.14.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 14:16:36 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:16:34 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <6ktdiyivdf6pz64mck4hbxxxvvrqmyf5vabuh7zfzfpcm4cu6z@oh43gmbrs2tj>
References: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
 <rq2wbrm2q3bizgxcnl6kmdiycpldjl6rllsqqgpzfhsfodnd3o@ymdfbxq2gj5j>
 <ZrM8g5KoaBi5L00b@shell.armlinux.org.uk>
 <d3yg5ammwevvcgs3zsy2fdvc45pce5ma2yujz7z2wp3vvpaim6@wgh6bb27c5tb>
 <ce42fknbcp2jxzzcx2fdjs72d3kgw2psbbasgz5zvwcvu26usi@4m4wpvo5sa77>
 <74f3f505-3781-4180-a0f3-f7beb4925b75@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <74f3f505-3781-4180-a0f3-f7beb4925b75@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Sneh Shah <quic_snehshah@quicinc.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v4 00/14] net: stmmac:
 convert stmmac "pcs" to phylink
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

On Thu, Sep 05, 2024 at 11:00:31PM GMT, Andrew Lunn wrote:
> > Hmmm, I'll poke the bears :)
> 
> Russell is away on 'medical leave', cataract surgery. It probably
> makes sense to wait until he is back.
> 

Ahh yes, I forgot about that! Thanks for the reminder. I'll be patient
then and hope is surgery and recovery is smooth :)

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
