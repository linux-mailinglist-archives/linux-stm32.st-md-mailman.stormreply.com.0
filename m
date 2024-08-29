Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3DF96460D
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 15:14:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D152CC6DD6E;
	Thu, 29 Aug 2024 13:14:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B8D7C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724937288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMkwOi4JjN6JJkWoqwgZkqx+R20QEZgxqkFxgjlzSuM=;
 b=TlsbY6AQF22oyqK6yRlm4Yj8WEJyKcB28J8ZDoPlgcmeSJQZSg6K7WPn8hbqLCkoqx35wD
 O6Lvi/yG4l8jebJvLBnPil0E80pfBxlEzR7WmfTVsLgbTrCvp2TB7GhoSxbLwwcr2taFBM
 l6+3deRgTc5khif1M7KEskYGpiUcb0g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-Mr0q1358NJCgkd2xkMZgZQ-1; Thu, 29 Aug 2024 09:14:47 -0400
X-MC-Unique: Mr0q1358NJCgkd2xkMZgZQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-45029c1e5c5so8875821cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 06:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724937286; x=1725542086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KMkwOi4JjN6JJkWoqwgZkqx+R20QEZgxqkFxgjlzSuM=;
 b=eoUg4WzmGyKL05sHk5HdsX3mn7wIB9Qmuzi7F3UwBpaxeSafaTlOBHLLtPb1y2xk5b
 Erd3TMVlBaIW4TfYqqt2RgS8ypRweyz98grLrS7xTxJ0zvC8kUmeq8BZ7ETvLWlVz2F6
 Z3MI3OnJRo+FRW0S3QEw10NwaZ/rYKnho3GZ6VK6p80Eo/uA8i8HSwnyaIxg/H0eXC10
 3MmwjF+ny/uqsTtBvem00ys6VFVL8wS3jfknn5Ib2Z1xEiADslGwvmSg68T+f5M4qCmi
 M/FeLgoK+GeqwcT9+/bGjEgGkaXm+Wfjz/zsGVoRa+iUM2qJPCE6GmgaZ9F+AUU6mY5+
 wy3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRY5bM5DaFv9cvrrOS0c6LXAErcH3jc/l7tLx8xnOfN1TEjka+RZRS6raPlDqJk3QcinJtJsh31HsFFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwTFdFGRbBJuorB5e46jN4o8IPNEUilWXmiFcbVQQU+7M8NU7Ol
 pu8lnJSkK21QH1XQLfhsvBA4h12dzLVhfwpVgUU2aEJR9GeaxLAbmkHFk0z2FZfPH4oLpSc/87b
 9k6wc6HrutxBFG9R4sRlOluk0azGF6lkE2vS5h0413xbimVoSRYVu3Ay53LrRWNttGztkCtYQhS
 +OxA==
X-Received: by 2002:a05:622a:418f:b0:456:45cd:db71 with SMTP id
 d75a77b69052e-4567f592c65mr35525031cf.21.1724937286481; 
 Thu, 29 Aug 2024 06:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFur2WCumVIV79Jh3TYo0EaOZHBpT13u9xP4uBg+9WfG5rJuXo7es8ZRNZVfgld+I/exrnwqg==
X-Received: by 2002:a05:622a:418f:b0:456:45cd:db71 with SMTP id
 d75a77b69052e-4567f592c65mr35524161cf.21.1724937286065; 
 Thu, 29 Aug 2024 06:14:46 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45682cb02casm4742421cf.42.2024.08.29.06.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 06:14:45 -0700 (PDT)
Date: Thu, 29 Aug 2024 08:14:43 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Dmitry Dolenko <d.dolenko@metrotek.ru>
Message-ID: <ibna42mzj4tk3kddnnzgosglumngupdwxnthkm7rkqrejbr5oy@7j4ey2gtl6zl>
References: <20240429-stmmac-no-ethtool-begin-v1-1-04c629c1c142@redhat.com>
 <20240828143541.254436-1-d.dolenko@metrotek.ru>
MIME-Version: 1.0
In-Reply-To: <20240828143541.254436-1-d.dolenko@metrotek.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: system@metrotek.ru, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, quic_abchauha@quicinc.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, quic_scheluve@quicinc.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC/RFT net-next] net: stmmac: drop the
 ethtool begin() callback
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

On Wed, Aug 28, 2024 at 05:35:41PM GMT, Dmitry Dolenko wrote:
> Are there any updates on this topic?
> 
> We are faced with the fact that we can not read or change settings of
> interface while it is down, and came up with the same solution for this
> problem.
> 
> I do not know if Reviewed-by and Tested-by are suitable for patch marked as
> RFC but I will post mine in case it is acceptable here.
> 
> Reviewed-by: Dmitry Dolenko <d.dolenko@metrotek.ru>
> Tested-by: Dmitry Dolenko <d.dolenko@metrotek.ru>
> 

In my opinion the tags are welcomed.

I had sort of forgotten about this until your reply, the use case I
had was only to try and force out another bug, so it slipped my mind.

Since both of us were bitten by this, and nobody has indicated it's a bad
idea otherwise, I'll rebase and send v2 with your tags to try and get
this merged.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
