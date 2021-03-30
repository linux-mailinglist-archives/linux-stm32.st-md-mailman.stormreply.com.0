Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DF34EAAB
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 16:41:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20A40C57B5B;
	Tue, 30 Mar 2021 14:41:52 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61C00C5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 14:41:50 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v25so81363oic.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 07:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eZVk5HwOIZYw5GgIVnw8moCjCB0WlBS7c5il9aL9gfg=;
 b=sPub2FJVC6qomE8/ibZGMW6PKKWl2ZzcK29+WJHUs+Ik3sDMowa1v5+GePBLwxONOl
 d6zCEwXw9giynX5vUTnh/QfqoldrIEj1PO1eToCEn+dFcO7GjF4tJFBks0fMFImOuDr6
 aVOghZ4SaIBHXmDlUQf1SAK5n7sHhvlLTdr/zbNsgU4rxe2XEB+ZxzoGbIIfrmxTy/SL
 PZ0AFHJATDPpPp7bZeWpDKceQdKIUfzdlro12jH9RLxQ3fZgmUm4VyUPtqj/tapZfhtn
 YruXNn4Sg4k5ur9S8KkDm3GJZUgqSArw7OzGusqhERh2ItDeJhYkBtUQMiB+W6ELyw1k
 mMsw==
X-Gm-Message-State: AOAM531KSf+Rrx7h9ZnutHlyEvQ5LEmSYkdiHzZsGTv2BmtHUo+gVk+/
 JfqidLFtavkTqcTuEZycIw==
X-Google-Smtp-Source: ABdhPJx55NwuqXBS3css907bO+xpLddBHVOG6AhiBjHmWmK11igajLJ2LYI1GahCDTKi3ToWCV5Z+w==
X-Received: by 2002:aca:b244:: with SMTP id b65mr3536409oif.134.1617115309176; 
 Tue, 30 Mar 2021 07:41:49 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.136])
 by smtp.gmail.com with ESMTPSA id l26sm5185388otd.21.2021.03.30.07.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:41:47 -0700 (PDT)
Received: (nullmailer pid 278300 invoked by uid 1000);
 Tue, 30 Mar 2021 14:41:41 -0000
Date: Tue, 30 Mar 2021 09:41:41 -0500
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210330144141.GA278273@robh.at.kernel.org>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322092651.7381-2-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: remoteproc:
 stm32-rproc: add new mailbox channel for detach
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

On Mon, 22 Mar 2021 10:26:50 +0100, Arnaud Pouliquen wrote:
> Add the "detach" mailbox item, that allows to define a mailbox to
> send a IPCC signal to the remote processor on remoteproc detach action.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update from V1:
> 
> Fix indentation error reported by 'make dt_binding_check'.
> 
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
