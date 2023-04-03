Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 747756D4254
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 12:40:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22E73C65E70;
	Mon,  3 Apr 2023 10:40:57 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DC1AC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 10:40:55 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x3so115333595edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680518455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7rH4uIzXK6l/huexlMRSE33rdhZjT66DcZAUi1ClaS4=;
 b=VjzIrsxcDH0WJ3uHgurjG8DLu7Ww0YaToip4InOiw5KExsOZhE+D/y/Ui07bKpTXNL
 Rp4jc5oYrBvXumCxwwiFEOlGrnQYRN+0P9dsQuNuiTcZ3K038TfNUK74tJpntKiVhnlp
 +0oZxYiGVujBc4kN/8SSAD7RPmRRhjVqksKKUHUYY50pkXoelsGSOlKtuwSw+DusZptk
 ba80/tO4D51qtrIEiRkhQou4Hk9pqZaPxYDH+kPzh/D11yQSd+mkpl+L8DuVONzxFToP
 nstJnVb4Su/u8u0PzC1WUHjDr3RNyLj3BOncQDyF2K2AJKE/OVvcjUfBqPmTuwto21Ic
 5BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680518455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rH4uIzXK6l/huexlMRSE33rdhZjT66DcZAUi1ClaS4=;
 b=koWQCXgxJ7Lw5cXzXa8dEuFVFlOToreJkMcz4EnyLE7KidW+V8XYEk8b1DiX0VTKAQ
 3EG81islSPHApuqwz8kwq46g4IrB5hEoCR3UEcofXmguir7xmnhuiyvxEaGF1PGxF4SN
 J4NYxrt6Hjj0mCMA5eDIdDeUa1ll1dBARpehUg9fYLMN0TZuKiwIOMevWIIBixrhSgQL
 VO5ZYjMi/2TXaajpNzy5E20R5b3J+VeDhodcmRf/eqdtCgxHuYl7yqy/Pz2ZfQXiE3Gj
 dupsRrhfhqsXhwYC01JJR/geU8RLDiHF7o+af3W3Kcf68D2Cl+aWnY6Ii/B7EBL0quvQ
 0V6A==
X-Gm-Message-State: AAQBX9faEJYXYDg76TCKBnMPr+qbiwkcyqta6uhiR/N6SnrhBsnTd6wI
 z/4P+VRA0gmZbYBOr7nUISI=
X-Google-Smtp-Source: AKy350aa1xWzLgKsAnyzR7hMjG5OX0qJ4S0qBFsoTR/lpvin5ToJ/JsS0ZwD4gLSvUfrbT3kW4xzKw==
X-Received: by 2002:a17:906:4fc5:b0:939:4d6d:1f26 with SMTP id
 i5-20020a1709064fc500b009394d6d1f26mr41117892ejw.50.1680518454254; 
 Mon, 03 Apr 2023 03:40:54 -0700 (PDT)
Received: from skbuf ([188.27.184.189]) by smtp.gmail.com with ESMTPSA id
 l22-20020a1709061c5600b00927f6c799e6sm4349395ejg.132.2023.04.03.03.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 03:40:53 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:40:51 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <20230403104051.swr25d3bpenha3wp@skbuf>
References: <20230403081717.2047939-1-xiaoning.wang@nxp.com>
 <33b8501c-f617-3f66-91c4-02f9963e2a2f@pengutronix.de>
 <AM0PR04MB5089AD62F07221A7FC326E85F3929@AM0PR04MB5089.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM0PR04MB5089AD62F07221A7FC326E85F3929@AM0PR04MB5089.eurprd04.prod.outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: remove the limitation of
 adding vlan in promisc mode
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

Hi Clark,

On Mon, Apr 03, 2023 at 08:43:54AM +0000, Clark Wang wrote:
> Thanks. I will add it in V2.

Please always check the latest state of net.git/main before submitting
patches. In this case, you seem to have missed the existence of commit
a7602e7332b9 ("net: stmmac: don't reject VLANs when IFF_PROMISC is set").

Please also check Documentation/process/maintainer-netdev.rst for next
time, especially the part where it says to designate the patch as
"[PATCH net]" (it also says to add a Fixes tag as Ahmad already pointed out).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
