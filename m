Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C9839BF
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2019 21:40:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06DD7C35E01;
	Tue,  6 Aug 2019 19:40:47 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5530AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2019 19:40:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l9so85766963qtu.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2019 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Y7UpGezK0Ud1sFcHnTxPRnpHSsAKoECEyD/JfXJH5eE=;
 b=I5CqAKAJvqBMZ7cVCkQIZzJxWZqDXUmJ4fuZDVxnWO0sObj/kWqJbEiCN/DzeHzivD
 8qIms80lB/zz/ShDMd1VDvdRN5EHjP6LkKuODP2W1iTPeIp7KvpeOh3En1pcYoAc3Skb
 b/zSpO5QpmAhh+C24sIQTl8wTjGjmmr2hy0pKlto1ERsY3Q+W6NriEtj+HuB9Y6nMnW7
 JqSd1u8UcvNaomN3QglbfI8msemVHGvNViZ3+xfWbF5a4Qdup9cHeqGz4eEbTGK4PHmu
 4XeeL8psXWyoNs2BhXqpxpv7h2YNndQJsFnQrVsxQfthViC+T/3V6S83+MCSBw1y3pgZ
 1J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Y7UpGezK0Ud1sFcHnTxPRnpHSsAKoECEyD/JfXJH5eE=;
 b=VMEmeesRLREgehA3n69lZIdNdP2MboLX7HCVEAcpZdQTsE6C9vF86ZITwQUiMIerzm
 tt0134bYW+HKTfxQv0VMiqnx9lQsR0HeMnNc2fJQiFgVSQf8Aqu+mvV3cHOmc2pF8cHV
 iGSMHlP2MG+n915x9YgRq5im0IhehNi6KRyKXN8BFMMYWYEaCfe/B8ZaHVXvzicKWYO7
 Fml2IpUT1bUMH1NjaUxPG0itLlhGzwvqpfeakvrfAU+Sq7Lihe7LI1awOg9g24FjeMeN
 dHS+MB4Dd+iVUFSuVVqBlsG6noZtGlcKCuttWsCzcFv3CTVlRgWC7+bGT/oqp+T0qLGn
 36nA==
X-Gm-Message-State: APjAAAWkQaLMP+BnRxhbQcpFQKT5Hg6XYaKMgspFMQ9TkJZQdKCeGScX
 /oJFvOU338CI6H4zyHh6A/j2XA==
X-Google-Smtp-Source: APXvYqxi59nkItJAOGN4OwKGOH4912Tt8J12kJYya2XOtlNL8EkJaIagn0XHoE9jbWY9aKFh4K3utQ==
X-Received: by 2002:aed:3091:: with SMTP id 17mr1193900qtf.290.1565120444179; 
 Tue, 06 Aug 2019 12:40:44 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id y9sm37534001qki.116.2019.08.06.12.40.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 12:40:43 -0700 (PDT)
Date: Tue, 6 Aug 2019 12:40:17 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190806124017.77e0f63c@cakuba.netronome.com>
In-Reply-To: <cover.1565098881.git.joabreu@synopsys.com>
References: <cover.1565098881.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/10] net: stmmac:
	Improvements for -next
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

On Tue,  6 Aug 2019 15:42:41 +0200, Jose Abreu wrote:
> Couple of improvements for -next tree. More info in commit logs.

Code looks good to me now, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
