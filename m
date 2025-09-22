Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC397B93854
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 00:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61D42C3F92E;
	Mon, 22 Sep 2025 22:51:31 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AE23C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 22:51:29 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4b78657a35aso192001cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1758581488; x=1759186288;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rsFqUYLoEXoD5J7mOVBIukerFwBJh/oFQEJX3GcFNXs=;
 b=fCAazVEB9lnHKwn8ehMSdk3hEqRH6klv72aNbZgKuxEfjB2xaANVaE3ZjdJJwAxMi6
 6mbhfpAkNxSQdbcz05bfnQ1mfbBylGECVI8ZAqjl8zsyK573u2TFaDeUFFuRen9XIavS
 IAzd1DfH6oWKVm9ezI6pxJZpkto8HxGXRmlT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758581488; x=1759186288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsFqUYLoEXoD5J7mOVBIukerFwBJh/oFQEJX3GcFNXs=;
 b=U5zxntJS6npQxknhUlvLv3VD4/aGlznaEPo9n8wKwlh+m2w5T6Ywm6Yl/BEFjISLXx
 +Sar/0Foq6vhMp1z2qnKZlpGlDWWH487BpN+LytMJPNtXRLSyw68KtQlxy4aJoWBorwT
 W7FPakWtYWlePROu6UsdekwKQjb1JNH0fJw3YEnrlpvI03hqQCItHFgwtf7Shgnby+ZT
 aZ9ODhp9NsrNvCXi0mrVD/szI/kR+J6P6k3KTc+LUImCtZxzH+aO2MgGT7Fph7i9ykyH
 GbSF3oOVjY55nB/zEHfNakZ8zYx2WiMVOFY8M6CxddeNEbRiO/XBk8wbAvtQkFosX0eE
 TC9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkLTRiXF0r9jm4CCq6TY54CIkYo8VJOuuTO+Si8VZ8xzCut8L7cynTmqHxjDKVuAKRlNpJavg933lRkQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzpxsc6nS2OvkpGrKP2IjIAQW2YlVpivGdsxQd/bYk8/pMq0xVj
 bN6O0KRu4aExdAxQg5BlFfp2329xwZ1u1nbxnigtuPXPZMzIXFdDo4sTLMetA/fMK5IT3+H5czN
 H+R30XStgxEzy9xNBQl3thb0PtYL0zyEnuWhRtlQ7
X-Gm-Gg: ASbGnctqV7riyI3dQ04Bl+Q53BWQmTBO+Kz4HPIiTrq/MTY7J1f3y1zmobSf2q50fS4
 BhL9SE5PO0QXafGzmuwAegAofZR4daESIuRRt0v0lpGaCIj4y6TRUVFscLT7SSdmP+ejOM2JiSg
 DXZcEw/9PEpAZP/iFrHmUADO4kgdpOQx0KBVeklcf/Tljsu4MTq9+aIxigm2NjwlTqtrdIaohOr
 dHA
X-Google-Smtp-Source: AGHT+IG18k04i6yd+3w9+a4LF8r3bj/68nzAYS3FJRGyOwOiHFPA+oaENwNeQlDYdFKOGHnIPYNxxRKsOoNLzUX4L7k=
X-Received: by 2002:ac8:5f89:0:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4d34fd300e7mr1230171cf.2.1758581487970; Mon, 22 Sep 2025
 15:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
 <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-2-b3dd20e54db6@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 22 Sep 2025 15:51:15 -0700
X-Gm-Features: AS18NWBZljaWhB_nmi4xcbYeOCnxdVtC_xiK4EoqJwWbbbZzXiw46pHjGIXlGuI
Message-ID: <CAODwPW9Js2AjSzQrvRFMK3xHXjbb6qV2bGEj3GhYWpDELniyCQ@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 2/7] dt-bindings: memory: introduce DDR4
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

> +      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,10},[0-9a-f]{2}$"

I don't really understand why there can only be up to 10 characters in
the module part number. I also don't understand why you wrote "20
bytes (10 chars)" for this in the previous patch. Are you assuming
that module part numbers are UTF16LE? According to my reading of the
spec, it sounds like they're supposed to be plain ASCII, i.e. 20 bytes
should be able to contain up to 20 chars.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
