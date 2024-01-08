Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C48275F9
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 18:03:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 696FFC6DD74;
	Mon,  8 Jan 2024 17:03:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 838EAC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 09:15:56 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a28da6285c1so278736766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent.com; s=google; t=1704705356; x=1705310156;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQw0PBv7H3F9npAXhHpc/yO+0aZTdw3iW7XYRioBY9M=;
 b=Nr++wbtaPie4tnbTxGTmwatSY4nHn8kOBna2k5GhTjJi5ihD3FQm91d4nZoF7RzGYk
 rvKz9GXF+ADfAIhJk3F4WwzWkBveClyguNFsZeKXR3CtmQEujmn8p1VHgOaJNhXoibWD
 oV0kuz9/OalyYxmTGDsrsxcuQIYsTIPcBQ1HsXs4qkEZl580iY7BL2atOnoGxz0cHdz6
 1RRwnLctnsaSoejvgB/ExJo55EB/EIPvf/bO4FLata8WwqMj58r2RG1khIJQLu0jXes3
 NkG7cys8KkXHOfQH7tXx7FW1C0duLNQRtREgjUd8DgJQdwfBbzNVHp4F0IIiIS/O73LL
 kAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704705356; x=1705310156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQw0PBv7H3F9npAXhHpc/yO+0aZTdw3iW7XYRioBY9M=;
 b=oHgdzLa1b634hG1CRvwhLuuHeMD6GxyAlNehu/xpnzLKF+P78nMZDkd2HHhLRjFKMs
 JlSkIaAzfnEf+Gyjl1bUTx/8kaD2T8lpGDjpnVzZD6fMmCUj+AEHchSWFXelzsRNPwk8
 RhUeJK8ZuNp+3rxPW2LxV2Vk2gAHTlzkbd+vmjZuCL1p6FkdwtPg+uMipzu25I+2d+2V
 9GWXfjJYocg0ZKX5rQ38+N8y4NsVojKYBoWjAghIJiKOkaZmFdIJTERI9VT6P48wXH8v
 fn9GaRDyFUcInSHtt3h5OYzXP6SELJDwq1XdOxC4NBG85VuW0oGmbDa3l+D+VqG4BbfP
 xWzg==
X-Gm-Message-State: AOJu0Yx1x/MqlggZJAkRsjgrYLxwConiMTxuuSLdowzb/cFisnPWlTTQ
 ZpiKHe4bSHPIPUDT6mNqpgbxWlXXSdmjEYYbBTr4fKP+ELkXHg==
X-Google-Smtp-Source: AGHT+IF5FdPBR02bei/X14Ub000OcoVXRo17m86hQ2MPBeQuC7hWG3H6v1jptH9g+ATyuoxWlGDUexOGIPMl6jmv1Ns=
X-Received: by 2002:a17:906:1797:b0:a28:bd9c:8363 with SMTP id
 t23-20020a170906179700b00a28bd9c8363mr3034170eje.57.1704705356043; Mon, 08
 Jan 2024 01:15:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704565248.git.dxu@dxuuu.xyz>
In-Reply-To: <cover.1704565248.git.dxu@dxuuu.xyz>
From: Lorenz Bauer <lorenz.bauer@isovalent.com>
Date: Mon, 8 Jan 2024 10:15:45 +0100
Message-ID: <CAN+4W8gPeQ2OjoYLKXsNPyhSVTB+vcSaS3Xzw=-M9Rf5MXfKPg@mail.gmail.com>
To: Daniel Xu <dxu@dxuuu.xyz>
X-Mailman-Approved-At: Mon, 08 Jan 2024 17:03:41 +0000
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/3] Annotate kfuncs in
	.BTF_ids section
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

T24gU2F0LCBKYW4gNiwgMjAyNCBhdCA3OjI14oCvUE0gRGFuaWVsIFh1IDxkeHVAZHh1dXUueHl6
PiB3cm90ZToKPgo+ID09PSBEZXNjcmlwdGlvbiA9PT0KPgo+IFRoaXMgaXMgYSBicGYtdHJlZXdp
ZGUgY2hhbmdlIHRoYXQgYW5ub3RhdGVzIGFsbCBrZnVuY3MgYXMgc3VjaCBpbnNpZGUKPiAuQlRG
X2lkcy4gVGhpcyBhbm5vdGF0aW9uIGV2ZW50dWFsbHkgYWxsb3dzIHVzIHRvIGF1dG9tYXRpY2Fs
bHkgZ2VuZXJhdGUKPiBrZnVuYyBwcm90b3R5cGVzIGZyb20gYnBmdG9vbC4KPgo+IFdlIHN0b3Jl
IHRoaXMgbWV0YWRhdGEgaW5zaWRlIGEgeWV0LXVudXNlZCBmbGFncyBmaWVsZCBpbnNpZGUgc3Ry
dWN0Cj4gYnRmX2lkX3NldDggKHRoYW5rcyBLdW1hciEpLiBwYWhvbGUgd2lsbCBiZSB0YXVnaHQg
d2hlcmUgdG8gbG9vay4KClRoaXMgaXMgZ3JlYXQsIHRoYW5rcyBmb3IgdGFja2xpbmcgdGhpcy4g
V2l0aCB5b3V0IHBhdGNoZXMgd2UgY2FuCmZpZ3VyZSBvdXQgdGhlIGZ1bGwgc2V0IG9mIGtmdW5j
cy4gSXMgdGhlcmUgYSB3YXkgdG8gZXh0ZW5kIGl0IHNvIHRoYXQKd2UgY2FuIHRlbGwgd2hpY2gg
cHJvZ3JhbSBjb250ZXh0IGEga2Z1bmMgY2FuIGJlIGNhbGxlZCBmcm9tPwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
