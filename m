Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A33B0E5C6
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 23:57:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4795FC36B0C;
	Tue, 22 Jul 2025 21:57:44 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78E0AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 21:57:43 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-609b169834cso4708a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753221463; x=1753826263;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
 b=P1hg6O1P3tdK3xGaFJ2+Y+ibgLJbqKI5upiZtXyjgHX4pMvqu3UP54zh8gcfakTbdz
 1me/pu+WLHs6QjqBmI0+O2gWYKQ56gnWGFCoO5QT93YWSTHTCiBrR9X/l0t2Sduagv70
 PKx9WjrzXZMXNxXOMJkBsdLAZYeyjJWQ1D6wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753221463; x=1753826263;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
 b=Myk4BhX6824wnMjR09gNmMdRBHreTDyg0pQyCIuUF0L3YLzlqm46iDtxyjqaoRuOs4
 SZa5J4bYaF3iNi2uPHO3Gjn/winJphpVSF0TwtiV2jvGl6V0/VRZYUVm/bUgIBX44xGz
 oRkJH16RRXuIIpV+vkqlDgalBvYiBNcjlkHbWr7ut3j1/SxUXNPxa5WlO7O4UQnWcY/M
 yy582wvoWoecVue3b/5IVfMg0kft3KotioYWZltjCpSS2rNj96i2TpPfzJEict6Kxuam
 vVH5hNx0D4h23X8Dk75hRK4XV5eQdvs0DD5Nhz4a1CIZN8FKksUIcI+WXte66niXfrGB
 Ckwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Ypzu3+JqmC67+8vEjsL01hy86LIJzlMwDvUIpc1Vshll1NwH+AYsxHP68i6x6EKmkXVY8BqFillE1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6x+2AnTKJ1W9s7ohbxte4osLvPj4htocfX9lMkxWcTfCtEI59
 dFYWEpsucvxNrTM7dpxpIWk+bwNxSdPbktejd3JX8lnR2FkL6xf8g9uBSbbyv51x0jdW6tWU/uj
 iEQTopBwHYTnWxWwfPISerhOScFfx3Ccxr8uZqwVA
X-Gm-Gg: ASbGncs3zwxCo4KBENnp0T7djR14KvYVPatFYGEhPyyv6H+QhOwc7nOXBEgFCZDwPHS
 G+d/6VzuFJ8EPNMEMNAgPuY+fA69jXHLmn/LCMQmhrZzQ+C4U3DqWawW3InbmkD4FVn+/Xb3yF3
 OOUAew7Xi7z+6STXTbUkWU0X0JwP9miAlHbHZMw+TK8BwJ9vzBOcuqoLv6b3xDw3rXYwCbgEUHw
 Ysmqg6ytSjOflav8l+G0RcmmK01uKUEy5/1WLSJ9rrk
X-Google-Smtp-Source: AGHT+IHkklfoV2jGZf2D1jPpYNy6n0EzpENuUlCVLYxgOK9YU79IkYyUGg7ZPnpy5rOLdzOyNuNgg4SRmVW6s9CMDc0=
X-Received: by 2002:a50:aa87:0:b0:609:99a7:efdb with SMTP id
 4fb4d7f45d1cf-6149a3beea3mr33693a12.2.1753221462404; Tue, 22 Jul 2025
 14:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:28 -0700
X-Gm-Features: Ac12FXxqqdXiBOsL8hY8DFhm2tyZoxR-txMizljLW540w1cjvBjPCidmbvKnAZQ
Message-ID: <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 05/19] dt-bindings: memory: factorise
 LPDDR props into memory props
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

>        Compatible strings can be either explicit vendor names and part numbers
>        (e.g. elpida,ECB240ABACN), or generated strings of the form
>        lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID

When you say "in case of LPDDR" below, you should also change this
line to take other cases into account. Maybe the best way to write
this would be something like:

...or generated strings of a memory type dependent form. For LPDDR
types, that form is lpddrX-YY,ZZZZ where X is [...same text...]. For
DDR types, that form is ddrX-YY,ZZZZZ... where X is [...new definition
for DDR types, based on what's available in SPD...].

>    revision-id:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description:
> -      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
> +      Revision IDs read from Mode Register 6 and 7 in case of LPDDR.
> +      One byte per uint32 cell (i.e. <MR6 MR7>).

If this doesn't exist for DDR, then rather than "in case of LPDDR"
this should probably say something like "LPDDR only"?

>    density:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
> +      Density in megabits of SDRAM chip. Decoded from Mode Register 8 in case of
> +      LPDDR.

Can you list here where in SPD density and I/O width are stored for
the various DDR types?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
