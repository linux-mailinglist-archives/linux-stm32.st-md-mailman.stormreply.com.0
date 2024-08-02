Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A24249462C0
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 19:55:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31744C7129D;
	Fri,  2 Aug 2024 17:55:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC6A0C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722621326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mSKMynH7mqtKWkD5s3WwP3QMfudW/geCCwMv+N77MHg=;
 b=et0HRwr9juix77jxhvxhU/qc/9OYLIvxDK71ZNCF/8dAAaiu+n5zpk+HYH4F6ZPzJ56ySJ
 1L9oa3NvKOmbzgLIJOq4BUKGt2jDX1OiDaxeTs3bofSilX8NmYj61VV9ti+IoV8fnJdkuJ
 eKn+9OXsccpaA5Ea79qrusvCy3hvQ34=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172--rmO6iNhOiqRBwEtXUUp8g-1; Fri, 02 Aug 2024 13:55:25 -0400
X-MC-Unique: -rmO6iNhOiqRBwEtXUUp8g-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6b79d1eb896so115201336d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 10:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722621325; x=1723226125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSKMynH7mqtKWkD5s3WwP3QMfudW/geCCwMv+N77MHg=;
 b=TH4omydEA8uUiw2eITyQdEpAWVYdwKVDSmvMchnv7wVtMpi3Mj25CLMhdiAW9erCmI
 kFBEJ+UisdelpOFwPAqeiDA4olQDMj61MIQPhKiVKJHQjchI2u2GCTjPUrT9OOB14/z6
 +q1GFToEnAzjHrFj7Hs1xN+RbtVzbGxMoXdYuXiKIVZ/lTMvfLpEbGV/7sADDI7XDuCz
 0q7rD3icrgFfO7fX1Nx9wT7aPGESNYE+hppb9kONnqrtJ28DoB2ElYJCesG/mhLd1bEL
 cgKIzYg1cNVN+S8HJHnx/iT6OdUXGK320hnCE6Pw1aBDViaZSK9bpWhC0HvAaX0tHLnV
 m3Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVukk4g9wHdpT+ewu/2RsDdJNDgulCLL8wLx5vMJt6hdwSRSpTlcuHuLSKx3606bM8gK95adnOYZbUtg6wACZnn4y5BlTRu2rV2IkFqdOQ5v+6WhtjWuQFW
X-Gm-Message-State: AOJu0YzOAEY/HudqV90t5YSXNnWkqTztku7dTHjwKSSOhHrhmVFKFh8b
 0dMMvFmvmykg7NzEwJ4UBY4ODUdEN0Zub1OO0Sres/CiOrEQxI+tcq4Y6LVmzDi2BaL4MAnhbg5
 XchHsCl7u5fFHvqFsGPqozgKoY3wRcVL6WpnvKS3XsZ6kHBxgVaAb+lbI4akC6xkdLTrJ3HEWhS
 wqXw==
X-Received: by 2002:a05:6214:4906:b0:6b7:a1aa:994f with SMTP id
 6a1803df08f44-6bb984930cbmr43871606d6.45.1722621325079; 
 Fri, 02 Aug 2024 10:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvfmiXBn0WLDUS/+iZqeB7tPbwkJPYVpv9lxcQTRxIly8p6qsOwWEvqQVQyo1Xl6zPYGN0/g==
X-Received: by 2002:a05:6214:4906:b0:6b7:a1aa:994f with SMTP id
 6a1803df08f44-6bb984930cbmr43871396d6.45.1722621324736; 
 Fri, 02 Aug 2024 10:55:24 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c839787sm9000496d6.99.2024.08.02.10.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 10:55:24 -0700 (PDT)
Date: Fri, 2 Aug 2024 12:55:22 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <fc77km3ws5ucl7w2oyi3w6gvr6ovkzrt5tlhzh47qyowrak4hg@bqpjm5jgygbx>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpnq-000eGq-U0@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpnq-000eGq-U0@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/14] net: stmmac: qcom-ethqos:
 add ethqos_pcs_set_inband()
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

On Fri, Aug 02, 2024 at 11:46:30AM GMT, Russell King (Oracle) wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
