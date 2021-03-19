Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF3342816
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 22:49:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6894BC58D5B;
	Fri, 19 Mar 2021 21:49:29 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADA12C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 21:49:25 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id r193so7629010ior.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 14:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=DdFpA8RCuNet19LbBIUzBDaOeIQrmYimvT3B6l6LMdM=;
 b=nmvLJ4bMnV4DLU8aj/w3T8Bb80hcUrfZzS2iVncK1e3cs3pIZOgDqxLMyzUW/kKVho
 5B9x7SUwqN05YASn9WSLrWdtKxpC3OutLeGmfpvWslspyoT6lzR8utpjbqdkkVgCuLfI
 xqk5uESLNtMrHkKdDNiCujVlURQho/E5mMHnPgmJx8KGls8Z2cXMZQ09M8ukwYF3ocRb
 bwKk8bJ1dGx/nauxKivqrH6/1T5oSiifDzm8IFL7Jh35VJbqxFeuWaZiEV/RTFx05H5l
 8F1LCHiEplOhmNjRRrUoPy/YVeNclZNndWjbI10SPnJAijsFm4OGAiCtccvyAcxS9I/O
 dxSQ==
X-Gm-Message-State: AOAM531nH6X6yYqJ0ggO7u5ioTOv1INDUDk+5JwbVYQT/DS82ExkqEvm
 bOlsWr0TmVfPtRRhfkFmgQ==
X-Google-Smtp-Source: ABdhPJz8Qcg5u41fjcWJKrDLCvbUbZw/JCtRUZ8UWObSJSHQ7Pmnal/cQAkn0JIQ6hNFqKiFD056Zg==
X-Received: by 2002:a05:6602:2d95:: with SMTP id
 k21mr4205797iow.123.1616190564451; 
 Fri, 19 Mar 2021 14:49:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j3sm3048432ila.58.2021.03.19.14.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:49:23 -0700 (PDT)
Received: (nullmailer pid 1647636 invoked by uid 1000);
 Fri, 19 Mar 2021 21:49:12 -0000
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210318145923.31936-2-arnaud.pouliquen@foss.st.com>
References: <20210318145923.31936-1-arnaud.pouliquen@foss.st.com>
 <20210318145923.31936-2-arnaud.pouliquen@foss.st.com>
Date: Fri, 19 Mar 2021 15:49:12 -0600
Message-Id: <1616190552.569417.1647635.nullmailer@robh.at.kernel.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc:
	add new mailbox channel for detach
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 18 Mar 2021 15:59:22 +0100, Arnaud Pouliquen wrote:
> Add the "detach" mailbox item, that allows to define a mailbox to
> send a IPCC signal to the remote processor on remoteproc detach action.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml:68:8: [error] syntax error: expected <block end>, but found '<block sequence start>' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.parser.ParserError: while parsing a block collection
  in "<unicode string>", line 54, column 7
did not find expected '-' indicator
  in "<unicode string>", line 68, column 8
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml:  while parsing a block collection
  in "<unicode string>", line 54, column 7
did not find expected '-' indicator
  in "<unicode string>", line 68, column 8
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1455311

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
