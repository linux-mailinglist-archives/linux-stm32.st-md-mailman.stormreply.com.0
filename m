Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0950C3A8C33
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 01:03:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8013C597AE;
	Tue, 15 Jun 2021 23:03:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47B98C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 23:03:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4522161350
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623798224;
 bh=WBK8GrpEprcghWnNyrwT6kWzXp/Jz94GFIqC2zWgDrU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JXoMx6Y2oMLxMqKL7zqFlVWTitbKCiUckeputPz0XKOeRPd11tgbmF8IMT9k3Itie
 a8yy5bnccggqx1peCtnh6ghNE8kCi82VZ3h2SUfPdzQ4eCqrkFtvJH8upq7rCqY1cx
 1JHplTBdj3/Ui4bIt+e7TTg+nQ0EAwLF6hOza0eMww+OPYWiCm5NGZBkFSDbFep8JN
 lqC8uDv86aDNREX9+L1Si98ErCzbw9rEXP65PDw/9kJ4FW+odZglX+NLaCSlZYK/ng
 3AYwJ/KWRPdHzJ5g5JR5ne8/kxb4xlwgX/TUx4rPbqtZllI+wBIykTUTNWHlixrnwc
 SsFz9pN8BcZfQ==
Received: by mail-ej1-f53.google.com with SMTP id he7so377072ejc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 16:03:44 -0700 (PDT)
X-Gm-Message-State: AOAM5300nbHVK11nHvTEZcoxtL+wXNzEf1KI3fD7pR9I3zlFCMCjIDns
 pfkQ47G9iplOktggGtojyK4bwCqGbRGTmFhtlQ==
X-Google-Smtp-Source: ABdhPJyisgkjgLkaN0APZhInDthw5akaPjM+7qJQBi6KzOQnueY8+xWAafZiP63UckFpAWPh5P503AOeKqS2A81d82w=
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr1916674ejx.341.1623798222868; 
 Tue, 15 Jun 2021 16:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <162370200625.25455.5879439335776203648.git-patchwork-notify@kernel.org>
In-Reply-To: <162370200625.25455.5879439335776203648.git-patchwork-notify@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Jun 2021 17:03:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKEwrtZKK3viOzY8nW8fPmqnJO+WANvBfMzNYhg_aRrmg@mail.gmail.com>
Message-ID: <CAL_JsqKEwrtZKK3viOzY8nW8fPmqnJO+WANvBfMzNYhg_aRrmg@mail.gmail.com>
To: patchwork-bot+netdevbpf@kernel.org, David Miller <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 sernia.zhou@foxmail.com, rick.tyliu@ingenic.com,
 netdev <netdev@vger.kernel.org>, sihui.liu@ingenic.com, aric.pzqi@ingenic.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jose Abreu <joabreu@synopsys.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dongsheng.qiu@ingenic.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, jun.jiang@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v3 0/2] Add Ingenic SoCs MAC support.
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

T24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMjoyMCBQTSA8cGF0Y2h3b3JrLWJvdCtuZXRkZXZicGZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbzoKPgo+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVk
IHRvIG5ldGRldi9uZXQtbmV4dC5naXQgKHJlZnMvaGVhZHMvbWFzdGVyKToKPgo+IE9uIFR1ZSwg
MTUgSnVuIDIwMjEgMDE6MTU6MzUgKzA4MDAgeW91IHdyb3RlOgo+ID4gdjItPnYzOgo+ID4gMS5B
ZGQgImluZ2VuaWMsbWFjLnlhbWwiIGZvciBJbmdlbmljIFNvQ3MuCj4gPiAyLkNoYW5nZSB0eCBj
bGsgZGVsYXkgYW5kIHJ4IGNsayBkZWxheSBmcm9tIGhhcmR3YXJlIHZhbHVlIHRvIHBzLgo+ID4g
My5yZXR1cm4gLUVJTlZBTCB3aGVuIGEgdW5zdXBwb3J0ZWQgdmFsdWUgaXMgZW5jb3VudGVyZWQg
d2hlbgo+ID4gICBwYXJzaW5nIHRoZSBiaW5kaW5nLgo+ID4gNC5TaW1wbGlmeSB0aGUgY29kZSBv
ZiB0aGUgUkdNSUkgcGFydCBvZiBYMjAwMCBTb0MgYWNjb3JkaW5nIHRvCj4gPiAgIEFuZHJldyBM
dW5u4oCZcyBzdWdnZXN0aW9uLgo+ID4gNS5Gb2xsb3cgdGhlIGV4YW1wbGUgb2YgImR3bWFjLW1l
ZGlhdGVrLmMiIHRvIGltcHJvdmUgdGhlIGNvZGUKPiA+ICAgdGhhdCBoYW5kbGVzIGRlbGF5cyBh
Y2NvcmRpbmcgdG8gQW5kcmV3IEx1bm7igJlzIHN1Z2dlc3Rpb24uCj4gPgo+ID4gWy4uLl0KPgo+
IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPiAgIC0gW3YzLDEvMl0gZHQtYmluZGlu
Z3M6IGR3bWFjOiBBZGQgYmluZGluZ3MgZm9yIG5ldyBJbmdlbmljIFNvQ3MuCj4gICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvM2I4NDAxMDY2ZTVhCj4gICAtIFt2
MywyLzJdIG5ldDogc3RtbWFjOiBBZGQgSW5nZW5pYyBTb0NzIE1BQyBzdXBwb3J0Lgo+ICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzJiYjRiOThiNjBkNwoKUGVy
aGFwcyAzIGhvdXJzIGlzIG5vdCBzdWZmaWNpZW50IHRpbWUgdG8gcmV2aWV3LiBJdCBtYXkgYmUg
YSB2MywgYnV0CnRoZSBiaW5kaW5nIGFwcGVhcnMgdG8gaGF2ZSBjaGFuZ2VkIHF1aXRlIGEgYml0
IGluIGFkZGl0aW9uIHRvIGJlaW5nCmJyb2tlbi4KClJvYgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
