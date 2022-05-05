Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99551C1FF
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 16:12:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A884C628A8;
	Thu,  5 May 2022 14:12:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69213C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 14:12:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21A6F61ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 14:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84574C385B1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651759928;
 bh=9kKGbqy7Ax8pQ9tOpNa9LUy0PYX/J1ie6b/fyKllZXI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=nawYxfjPhRL4bzwePmnCZmMyAEcpNPqByStxU8odlYldMteDU4ed+80SDfldnVGRF
 P8oUaAG3ciIy++hjZXwFpITNDBYzKWHLvPDYQRHA4WV3Dqk09grlbSlx9BpCgCXFfd
 Va3+PIjSJjI+E4pJoansHNPwG1lbD+iP/vzzH+aJR0OzXyBqDxvQl6vlPlb0gP1Mu5
 1Rb14rmOgakeck1ivZoSTmSHi0jUaelHrQ32h8c3cHQZJRzaFSRuxCAnb5P+V1QKJR
 dT1Y+eGBgluELc9EUP7KExmvamUOU8Sh/RDNnqknPQauh1ComS/g7CtsHJI80kdO+t
 YGqYugV54sNMw==
Received: by mail-pj1-f50.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso8143031pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 May 2022 07:12:08 -0700 (PDT)
X-Gm-Message-State: AOAM533DaOREd8fALc5eGjVYBhRHthWMtojqCs8l2nS94RPd0vekFC2B
 7j/bF2EmmNvTDWcL2+3Ks7LaMaGWlBKlTJ6bXg==
X-Google-Smtp-Source: ABdhPJx6QoJIEpNhrIGK65CcEF58bMJpnUn8+5tpAp02FbR6n6SHQr1mCw8PWw6zJeBiQ5K3kqI2+chhbc/awm7mApQ=
X-Received: by 2002:a17:90b:4a4e:b0:1dc:55ca:6f33 with SMTP id
 lb14-20020a17090b4a4e00b001dc55ca6f33mr6466106pjb.4.1651759927901; Thu, 05
 May 2022 07:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20220422150952.20587-3-alexandre.torgue@foss.st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 5 May 2022 09:11:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKU28BNrozg20_a_XMUmBhaoDHdodWkzyRoH=VcM2pDjg@mail.gmail.com>
Message-ID: <CAL_JsqKU28BNrozg20_a_XMUmBhaoDHdodWkzyRoH=VcM2pDjg@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Etienne Carriere <etienne.carriere@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Stephen Boyd <sboyd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: clock: stm32mp1:
	describes clocks if "st, stm32mp1-rcc-secure"
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

On Fri, Apr 22, 2022 at 10:10 AM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:
>
> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> security support hardened), "clocks" and "clock-names" describe oscillators
> and are required.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

This is now failing in linux-next:

make[1]: *** Deleting file
'Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts'
Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml: found
duplicate key "clocks" with value "{}" (original value: "True")
make[1]: *** [Documentation/devicetree/bindings/Makefile:26:
Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dts]
Error 1
./Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml:64:3:
[error] duplication of key "clocks" in mapping (key-duplicates)
./Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml:69:3:
[error] duplication of key "clock-names" in mapping (key-duplicates)
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.10/dist-packages/dtschema/lib.py", line
914, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py",
line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 121, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 131, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 674, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 445, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 263, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py",
line 294, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 49, column 3
found duplicate key "clocks" with value "{}" (original value: "True")
  in "<unicode string>", line 64, column 3
To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 74, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
