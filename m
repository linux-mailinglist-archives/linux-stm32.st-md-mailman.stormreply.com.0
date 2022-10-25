Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FC60C4C4
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Oct 2022 09:11:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 571E3C03FC9;
	Tue, 25 Oct 2022 07:11:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40F83C035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 07:11:24 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id u6so10421552plq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 00:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OpGVdTHPTo8HE73NSMb14pa67PYd3cbhvavpF08Svys=;
 b=LFPhd8kXff5Z7xDxPYwT8GK84sP92AapJRipScMeKFvJXwYapY1fMnr6PnMk5UcN2K
 ZVe4XJF7X2BqqEiBgxCaCYvlUyDvtvTI9Q3o9jCAWVEVTj+M88JmvrDf4nndmZBlXz8k
 O5jXS0jS6RL4aB8UmCkmiK69x4wqGAo6bd8x05Z3/b/6ZeePVA+LREPpyNIazui8XwGz
 XJM+uosbpxVEcfLzGWaEcYUwewJyWNY/s4MTX1sEVxkmqoIY553Gg4FQhA3Gg/hjgWJb
 RHLjwPBzcn/ivHgjhepULYkri2KaXES6BkF4Y0tfGhr6kmB+6jtMPHlK24I9Xm5RGZWl
 ScYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpGVdTHPTo8HE73NSMb14pa67PYd3cbhvavpF08Svys=;
 b=CiTDOOUM/755te4PEvBLKVKjdcEeFMS5EIwkJFPS+kh3P2Q2HyzibK+s2+OQp2BgCi
 lJk6ooEUNbjcQItOY0gg28Nze1TvQYzcEV1u1yRn+VPSSFEthA9kZ1MDw4Ph+582VZ2d
 hDluD6ORBhOzpVEddveXS3oDIENJnXWQrAMdj5Em8qL00AiAdCcstMgxx5pl0Ao4AOGW
 iVJziRGNjJbRYp59aD/xv5nj77weveJBHQZ7RYakLwhb+NY8q+GPdm/nI7KPG8xd72dI
 i+Nw4W7LubqLjvteIeRvpVUp/ZmBbQRYz29pfTxU6L71AV9AnrNsokhnbD1CheIrueMl
 cm4g==
X-Gm-Message-State: ACrzQf2ZOVLsSCJA51E5pKQj6on1FjzNS3Tg0NdARicnKI5u56+P8YEZ
 2T1H1s4w11x5/H12QOMDl/o=
X-Google-Smtp-Source: AMsMyM78ep3vxaArGkOQSNI8U22FumC6eFJK6qze2I7VonY67ClnJIuiMq0XFH5PZaWrkMHhCxhZ8Q==
X-Received: by 2002:a17:90b:305:b0:213:8a6:8bb4 with SMTP id
 ay5-20020a17090b030500b0021308a68bb4mr11792021pjb.33.1666681882711; 
 Tue, 25 Oct 2022 00:11:22 -0700 (PDT)
Received: from smtpclient.apple ([2001:e68:541d:e8fd:fd7f:3fc0:34d8:db1])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ce8f00b00186a2444a43sm713855plg.27.2022.10.25.00.11.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Oct 2022 00:11:22 -0700 (PDT)
From: Wong Vee Khee <veekhee@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Message-Id: <03329169-560C-4319-AEBB-44BFFE959EBC@gmail.com>
Date: Tue, 25 Oct 2022 15:11:17 +0800
To: junxiao.chang@intel.com
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: remove
 duplicate dma queue channel macros
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

V2h5IG5vdCBjb21iaW5lIHdpdGggdGhlIG90aGVyIOKAmGlmIChxdWV1ZSA8IDQpLi4gZWxzZeKA
mSBpbgp0aGlzIGZ1bmN0aW9uIGFsbCB0b2dldGhlcj8KClJlZ2FyZHMsClZlZSBLaGVlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
