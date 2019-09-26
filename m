Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AADBF7EE
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2019 19:51:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26348C36B0B;
	Thu, 26 Sep 2019 17:51:35 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 513CEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 17:51:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id y39so2775946ota.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRBo1U1wJBMBsFedfuu4Oad4gF7xZhsuM6ZSQHPH+qM=;
 b=OnNRSW3XB6s5ucJQXxJXQsBRy1JldMeRW0F4MSDi7HvaLt3VVeS/2XZvGG78q+LmV3
 zI9U4AbwyAfrGneczOJdor/0MrNlSs3XnhKqZudTp7yX0kD5F29H8LYIHfASWTwjj2QY
 i8rv3TqVE6d7qztHTLIUU+pBwVryPrZqexCbJjYFAXhbD73xnHdBKkA2rmGHQ1xH8S9Q
 hESqdAoIP2vBU5qoxbKk8hunfYJAJdooKHZ5PrE/6/teyMN+6kZz7MDkul1xXF757bko
 SiBzKOPSimTW9QAOn6Q+wFJDYd5x7/TAcU05GEowkzM8+Y8Z28iHSlmA5KA7HibUmb1K
 wWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRBo1U1wJBMBsFedfuu4Oad4gF7xZhsuM6ZSQHPH+qM=;
 b=jWhhfutMo9v7Jp6Hsm6gs744P9SEXrckWWlW8EUN2xqaRToEECQcalNJa3Rxwq0FlB
 i5W0Qpr2dozWKJpqYrwS0ryosLqA5G5hC+3dNMFw2aEQLsfsWC4Kqwhh5yaUZpn5NJxh
 KMtyAyLeWxp+gVfPZYkxTh0KS1o8UGt5FsPpHn4qD/Om90MviC1A9TbP3znnMwqHkIGQ
 v0Ffa+v9bLSKs3iW+9jBbGhQnAQ316pAH0tShtmum0OiOMz5jrR3m6gWEJR3gXgzB00Y
 jD6xcdpzzX1ndQl6xYpFIP4Gk4E+bdYfUrFT9raFf3CDgi8PZq7ff+2g2jQO2ENUkC8l
 vomw==
X-Gm-Message-State: APjAAAW5Jbz1pgqmnd8ezrWQrK5pDwL8eiXmAGl80zpnx7TDuiyUI9Cj
 HKj+o4X/cie3vzn/JYNg8sSa8ZZNIMwxbEzF5DU=
X-Google-Smtp-Source: APXvYqwp9A2tjKQPnay8aqFF0fAxzgQxMo9Y09YF2RKzK274POwhGNUxLAVYH1NJYrKPlKizQ1rGrVEl6PEuFg+SeXU=
X-Received: by 2002:a9d:760d:: with SMTP id k13mr3342916otl.96.1569520291787; 
 Thu, 26 Sep 2019 10:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190925105822.GH3264@mwanda>
In-Reply-To: <20190925105822.GH3264@mwanda>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Sep 2019 19:51:20 +0200
Message-ID: <CAFBinCDZRkJJa_PnM5aAzG=pZkf15jB2gLDRkCqA5BwHMvM+Mg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-meson8b: Fix
	signedness bug in probe
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

+Cc linux-amlogic mailing list

On Wed, Sep 25, 2019 at 12:59 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "dwmac->phy_mode" is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
>
> Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for catching and fixing this!


Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
