Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51C94E713
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 08:46:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BAE8C7802E;
	Mon, 12 Aug 2024 06:46:41 +0000 (UTC)
Received: from mail-m1017.netease.com (mail-m1017.netease.com [154.81.10.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45FEDC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 02:22:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=GauB9BT9+oze0jVPTw9311pKv6jojAT8Eb+UXix1yIGMVlYWCYy1Mb/r7lw8mjcLAX5WxuBJVUaV3KrGr3hRu9WsRNx2P6xQfFEv+CNomccjTNPAVSlZZuqPcSyAx2Djdagb5h+9atqpE2dqtCrAOaGhar20zjOK6i+l3WehoUw=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=l8QGF7m+tWamOGFzveCogZrGydzazrOPiKFmpa5wteU=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.94] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id C71AB1405AC;
 Mon, 12 Aug 2024 10:21:27 +0800 (CST)
Message-ID: <a73ff2ab-7e68-4d6b-b38d-37e7303af40d@rock-chips.com>
Date: Mon, 12 Aug 2024 10:21:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
References: <20240808170113.82775-1-detlev.casanova@collabora.com>
 <20240808170113.82775-3-detlev.casanova@collabora.com>
 <3724132.9z1YWOviru@diego> <3304458.aeNJFYEL58@trenzalore>
Content-Language: en-US
From: David Wu <david.wu@rock-chips.com>
In-Reply-To: <3304458.aeNJFYEL58@trenzalore>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh4ZQ1YYSk1CGRpPS04eT09WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a914463fbc409cckunmc71ab1405ac
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6OCo4PjI1TAI2Fg8JQzIr
 SzEKCRlVSlVKTElIT0lCSUNCTktDVTMWGhIXVR8aDRIfVQwOOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0tKQzcG
X-Mailman-Approved-At: Mon, 12 Aug 2024 06:46:41 +0000
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ethernet: stmmac: dwmac-rk: Add
 GMAC support for RK3576
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
Content-Type: multipart/mixed; boundary="===============6405032522560535200=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============6405032522560535200==
Content-Type: multipart/alternative;
 boundary="------------yod5dpWQN5VbBEEUe5dYcqcL"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------yod5dpWQN5VbBEEUe5dYcqcL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Detlev, Heiko:

It's really a TRM error here, RMII PHY has been verified for this patch.

在 2024/8/9 22:38, Detlev Casanova 写道:
> Can't be sure about that. An error in the TRM is not impossible either, as for
> rk3588, it is also bit[5]=0: DIV20 and bit[5]=1: DIV2. I can switch them to
> match the TRM though, we may never now.
--------------yod5dpWQN5VbBEEUe5dYcqcL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Detlev, Heiko:<br>
    </p>
    <p>It's really a TRM error here, RMII PHY has been verified for this
      patch.<br>
    </p>
    <div class="moz-cite-prefix">在 2024/8/9 22:38, Detlev Casanova 写道:<br>
    </div>
    <blockquote type="cite" cite="mid:3304458.aeNJFYEL58@trenzalore">
      <pre>Can't be sure about that. An error in the TRM is not impossible either, as for 
rk3588, it is also bit[5]=0: DIV20 and bit[5]=1: DIV2. I can switch them to 
match the TRM though, we may never now.</pre>
    </blockquote>
  </body>
</html>

--------------yod5dpWQN5VbBEEUe5dYcqcL--

--===============6405032522560535200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6405032522560535200==--
