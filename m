Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F5163C8
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 14:33:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFD66C35E02
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 12:33:31 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3351EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2019 10:18:55 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z26so8421204pfg.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 May 2019 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G8pBOHepmnJE1/KzU1bAO4V1FlfT0xpTPU7pMbXBSIs=;
 b=YdndEbZRVbfd6JyBmK3pprG9Tj5uVoHj96dazYWHgaGCvSG9YackGco1b+A+QwJsbo
 2IB2Aw7AFIlHUyQQC8OO/PyGaFsdl3a+Ui0i9jS+jmmybLAhKCrIMdroPMTkQ4BW4r1J
 XSWyDl7hgLw/Es8QDdli57it39JXrJgf6xEww/UU0Hu1MQ8k/YIfVupnm/ShMrbpS40i
 TKaQf3XBE204zQnuxlm1FjbqkYCb/c4oOboF9mZGIDj6wFWS3BAOXO7ZYcUzlP4MtSsH
 wcYN7m+dzyRII4/Z/8oiuJ4u3KTWDHMSyqpYRZGyhveY3ro3kPT0yKrdQtrjvIXjMhrU
 OYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G8pBOHepmnJE1/KzU1bAO4V1FlfT0xpTPU7pMbXBSIs=;
 b=i3oMhQrdV+qL1d2bbiQ5tVdF0liGO6ramhRctcZEQKhvkYbijwFrhf2gFnOCDtBRfn
 WjkdYL71mqfa7CBLYeQcc/m7MSc0BzURJ4JEDPjCs7TMUtq/klCEFCbNJo4J8JtvxLkY
 Y4Yviu0FVxbW9+0rESP+mLp0kyMfuS8L+QBMQO/B9H+OwdMyoCM7EYgiXyMhLxaNW+tZ
 Sq2qM4u/pyG09T5b8mqB6COAqI6daTgQkfZwpiPzreifCCJLpPeC8LXz7Mo+ARB/CtHR
 ewhVBQ7STOjQ1SQnXDGnmu0gDuZzP9Wctad/5FxmQGDZ0yieYD6oin+NIDQDFKKoZemR
 lUPg==
X-Gm-Message-State: APjAAAW9WcBKfzB/MTnLwd7lb5kSZjSrYnniLtl2IH66pQcPOpaZem5O
 UztX9xa3XVh+PE65KTN6tTM=
X-Google-Smtp-Source: APXvYqw0MpKiLCvqwe8N+6fugyXUfcfqbZxka1Z+eJC2FrcXxk4z1+/4iDtrJjM2rg8zYe1KAD/hYw==
X-Received: by 2002:aa7:9ac4:: with SMTP id x4mr14324313pfp.43.1557224333621; 
 Tue, 07 May 2019 03:18:53 -0700 (PDT)
Received: from icarus ([2001:268:c1c3:2283:c70:4af9:86e2:2])
 by smtp.gmail.com with ESMTPSA id a6sm26288248pgd.67.2019.05.07.03.18.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 03:18:51 -0700 (PDT)
Date: Tue, 7 May 2019 19:18:29 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20190507101729.GA3420@icarus>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507091224.17781-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Tue, 07 May 2019 12:33:30 +0000
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

On Tue, May 07, 2019 at 11:12:24AM +0200, Benjamin Gaignard wrote:
> Quadrature feature is now hosted on it own framework.
> Remove quadrature related code from stm32-trigger driver to avoid
> code duplication and simplify the ABI.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Although this functionality is now provided by the Counter subsystem, we
should keep the IIO Counter interface for this driver intact since
existing user applications may depend on it; this is the same reason why
the IIO Counter code in the 104-QUAD-8 device driver was not removed
despite moving to the Counter subsystem.

Once user applications have had enough time to migrate to the Generic
Counter interface, we can consider removing the deprecated IIO Counter
interface.

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
