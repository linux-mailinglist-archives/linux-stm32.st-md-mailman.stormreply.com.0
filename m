Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B11A3B0A6A
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 18:33:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C2EC597AE;
	Tue, 22 Jun 2021 16:33:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1001DC58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 16:33:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D01D361361
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624379586;
 bh=3tr8hncMNi9n9tTtvYn+09fDt3+FvMj/q1Ji3UZ1EgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GYZgUOjlz9lEw31xY+3W3Cqd8k+sV2CnoaPGqM8aj9HRvQS5wsu8ml6Kf+n0FfQcJ
 dimJvVOuC4LloBXuiPawqgCrtL5vLWgyhtv2YIPK7E1zrmyXqMY+2YWilAY7l2VzbR
 rAPfJEFmq8jNz26svj2+MZa/Jdz2p3LkW8YA81Zd6cxI0+1gwgZv5bB5kryiC9/PPp
 WrD8XbZmd6euszMqHFOwBkeITPPYIjueUd0hS3WaebGNXiHwmZd3VW+drVFGwRxmP0
 MtLiHGSJ+svVenxwCBomjQLZKDiHjU/XyLgYGWWMZO7vr97f2Qn+23PHtrYGD3Obj0
 gxcHgyqoeg/Bw==
Received: by mail-ej1-f49.google.com with SMTP id ji1so29404365ejc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 09:33:06 -0700 (PDT)
X-Gm-Message-State: AOAM5329lFA85JcUURSNtaCmGu5UxpLdL7t2MyebfVpiFCG5tZGESXSk
 joMsPX46nGRRo06YtkPV7DDCiIxMkxYx9l6tbQ==
X-Google-Smtp-Source: ABdhPJzaK4BPffOFMlQOHCufbEOnv01yqcHgTSSrNru1lz1eHoJgyCIqXzdmpJWrwDK9jMQnJr9tGh9SfMgVXPEykI4=
X-Received: by 2002:a17:906:82cf:: with SMTP id
 a15mr4849734ejy.359.1624379585262; 
 Tue, 22 Jun 2021 09:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <1624192730-43276-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1624192730-43276-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1624192730-43276-2-git-send-email-zhouyanjie@wanyeetech.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 22 Jun 2021 10:32:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLuPG+XYBmL6hd_fW5NOwsB4rC1pYAc-_Erfbe-aW0DKQ@mail.gmail.com>
Message-ID: <CAL_JsqLuPG+XYBmL6hd_fW5NOwsB4rC1pYAc-_Erfbe-aW0DKQ@mail.gmail.com>
To: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, netdev <netdev@vger.kernel.org>, sihui.liu@ingenic.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 dongsheng.qiu@ingenic.com, David Miller <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: dwmac: Remove unexpected
	item.
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

T24gU3VuLCBKdW4gMjAsIDIwMjEgYXQgNjozOSBBTSDlkajnkLDmnbAgKFpob3UgWWFuamllKQo8
emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBSZW1vdmUgdGhlIHVuZXhwZWN0
ZWQgInNucHMsZHdtYWMiIGl0ZW0gaW4gdGhlIGV4YW1wbGUuCj4KPiBGaXhlczogM2I4NDAxMDY2
ZTVhICgiZHQtYmluZGluZ3M6IGR3bWFjOiBBZGQgYmluZGluZ3MgZm9yIG5ldyBJbmdlbmljIFNv
Q3MuIikKPgo+IFNpZ25lZC1vZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFu
amllQHdhbnllZXRlY2guY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKSSdkIGFwcGx5IFRoaWVycnkncyBwYXRjaCBpbnN0
ZWFkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
