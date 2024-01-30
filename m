Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B2842871
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 16:53:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B2F8C6B477;
	Tue, 30 Jan 2024 15:53:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47243C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706630009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSj1lyNclmh9b1DFiLfFnvUIxkzThYLUPlpLm9/wz/A=;
 b=IopQ6CkFdtaCaqV5cZ7dzixRvffYOoCKSoWpBlyKmr4hl10LYNAoynDeTDKhN4BjWUJqpE
 hgz3Eh5ZjBkbOqH7HaagGu2qIG4gP2dM8CKmGjarZGRNuZyiqhso8Si1dsWpTiPhUQGQvc
 vQ5nBVOIn3kzRE5EQoaWwvZn2S6rtC0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-L1QRh19nPdm5QqbwxjnUaA-1; Tue, 30 Jan 2024 10:53:25 -0500
X-MC-Unique: L1QRh19nPdm5QqbwxjnUaA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-42aaaba1bdbso23444561cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 07:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706630005; x=1707234805;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSj1lyNclmh9b1DFiLfFnvUIxkzThYLUPlpLm9/wz/A=;
 b=SHqxZw+Gkm99zz6tydyGath8LqIKzs2KGv19U348uWiakl6ba2SAmIj5G91wXSPlKS
 cScExCs4x118rXAZES6tl5NqXPXhSZG9hayl7vklGWOj0ZPCJ0Rq9kLAS5ZE67SNPqN8
 2wNULwKsnvCV+JepM6pqKSzxHqETpzR1Jb+am93r3ikqEtt5ubR9XSPSlAvsWFGQW+2s
 k+CEFTrMfhY89nLtPfcMBhtCR6BOxC48pvGtvTdBjaQz0q5IuOQVjZNkTUSz/GTX6oIa
 /MgPVEuQ9PYHA8Dh0uSul0LMEo+J+VLDDweZc1ypenXCfvTGcZgOuJnHANclq5d4haOz
 Wr5g==
X-Gm-Message-State: AOJu0Yym5OaQGUlUhIkpCMvEFTJW4yqb0H4Skx6CsMXhB6BIy53Av4/6
 BlULL3Igw68nipjDPSpA7V7/YIKNRrDPT/3ImGkF2D6RVcVwirZnjacBe5Mu4sukkuAvbBxdwre
 iKOYAb1jvvwSD+uM8wp03+n50daZz+3qskzMYCHuzZVaqRKVtNbI2HRgZir1vuGnO8/gapCJIFb
 GZnA==
X-Received: by 2002:ac8:5950:0:b0:42a:6df3:1f1d with SMTP id
 16-20020ac85950000000b0042a6df31f1dmr12272874qtz.74.1706630005297; 
 Tue, 30 Jan 2024 07:53:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVEawnHTN95Z6HJiyigSQy1AJjcgY3k8TnIlbRXYXuot4rDh5Z3hGCkiEuIFI9fTvFfvDK0Q==
X-Received: by 2002:ac8:5950:0:b0:42a:6df3:1f1d with SMTP id
 16-20020ac85950000000b0042a6df31f1dmr12272860qtz.74.1706630005018; 
 Tue, 30 Jan 2024 07:53:25 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 z12-20020ac87cac000000b0042a1223cb9bsm3313663qtv.70.2024.01.30.07.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 07:53:24 -0800 (PST)
Date: Tue, 30 Jan 2024 09:53:22 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <ual3c4fuuz5trgn2ekklsfeslwvswfjg5nij5epbnuf5mihfay@pp32fs6btwxk>
References: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
 <ZbkWwn-oN5wqoPfJ@matsya>
MIME-Version: 1.0
In-Reply-To: <ZbkWwn-oN5wqoPfJ@matsya>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bhupesh.linux@gmail.com,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Drop unreachable reviewer
 for Qualcomm ETHQOS ethernet driver
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

On Tue, Jan 30, 2024 at 09:03:22PM +0530, Vinod Koul wrote:
> On 29-01-24, 11:12, Andrew Halaney wrote:
> > Bhupesh's email responds indicating they've changed employers and with
> > no new contact information. Let's drop the line from MAINTAINERS to
> > avoid getting the same response over and over.
> 
> Looks like Bhupesh sent the patch changing but never followed up with a
> v2 for this:
> lore.kernel.org/r/20230915191600.3410862-1-bhupesh.linux@gmail.com
> 
> Would prefer if this is changed to his email (copied him as well)
> 

Thanks for finding that! Bhupesh, do you plan on spinning a v2 soon? If
so I will not send a v2, otherwise I can respin this with your email and
no .mailmap change.

> 
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> > If anyone knows how to contact Bhupesh / if they're willing to continue
> > being a reviewer feel free to suggest an alternative, but for the moment
> > this is better than nothing.
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 939f6dd0ef6a..b285d9a123ce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18080,7 +18080,6 @@ F:	drivers/net/ethernet/qualcomm/emac/
> >  
> >  QUALCOMM ETHQOS ETHERNET DRIVER
> >  M:	Vinod Koul <vkoul@kernel.org>
> > -R:	Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >  L:	netdev@vger.kernel.org
> >  L:	linux-arm-msm@vger.kernel.org
> >  S:	Maintained
> > 
> > ---
> > base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> > change-id: 20240129-remove-dwmac-qcom-ethqos-reviewer-1a37d8c71383
> > 
> > Best regards,
> > -- 
> > Andrew Halaney <ahalaney@redhat.com>
> 
> -- 
> ~Vinod
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
